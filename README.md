# FilmSphere

**Authors:** Parisi Danilo, Russo Fabio  
**DBMS:** MySQL

---

## Overview

FilmSphere is a relational database designed to back an online video streaming platform. The project covers the full lifecycle of content delivery — from film cataloguing and multilingual metadata, to user management, subscription billing, device tracking, CDN server load balancing, and personalised recommendations.

Designing the entire system from scratch was the core challenge of this project: defining a coherent schema across four interconnected domains, choosing the right normalisation trade-offs, implementing business rules as triggers, encoding geolocation without external APIs, and building a load-balancing engine entirely in SQL. Every architectural decision — from redundancy placement to IP-based distance calculations — had to be justified by a concrete access-cost analysis.

---

## Project Structure

```
Progetto basi/
│
├── 0. Drop.sql                          # Drops the entire 'filmsphere' database
├── 1. CreateTables.sql                  # DDL: creates all tables and constraints
├── 2. RecommendedFilms.sql              # RecommendedFilms table and recommendation procedures
├── 3. BusinessRule.sql                  # Triggers that enforce domain business rules
├── 4. Procedure.sql                     # Core stored procedures (8 main operations)
├── 5. Caching.sql                       # Pre-loads recommended films onto the nearest server
├── 6. EntityPopulation.sql              # Seed data: entities (films, cast, plans, devices…)
├── 7. RelationshipPopulation.sql        # Seed data: relationships (participation, views, subscriptions…)
├── 8. Rankings.sql                      # Analytics: film rankings (global, by format, by state, by plan)
├── 9. LoadBalancing.sql                 # Analytics: CDN load-balancing stored procedures
├── 10. Events.sql                       # Scheduled events (server load check, daily recommendations)
├── 11. AdditionalAnalytics.sql          # Extra analytics: annual user statistics report
│
├── Population.sql                       # (Legacy) combined population script
├── AccountPopulation.sql                # (Legacy) account population script
├── FilmPopulation.sql                   # (Legacy) film population script
├── FormatsStatesPopulation.sql          # (Legacy) formats & states population script
├── ServerPopulation.sql                 # (Legacy) server population script
├── QuickStart.sql                       # All-in-one script: drop + create + seed
│
├── ER_Diagram_NonRestructured.drawio.pdf  # Original (non-restructured) ER diagram
├── ER_Diagram_Restructured.drawio.pdf     # Restructured ER diagram (basis for the logical schema)
├── FilmSphere_Documentation.tex           # Full project documentation (LaTeX)
└── ProjectReport_2023_Parisi_Russo.md     # Original project report
```

---

## Execution Order

To set up the database from scratch, run the scripts in this order:

```sql
SOURCE `0. Drop.sql`;                    -- Clean slate
SOURCE `1. CreateTables.sql`;            -- Schema
SOURCE `2. RecommendedFilms.sql`;        -- Recommendation table & procedures
SOURCE `3. BusinessRule.sql`;            -- Triggers
SOURCE `4. Procedure.sql`;               -- Core procedures
SOURCE `5. Caching.sql`;                 -- Caching procedure
SOURCE `6. EntityPopulation.sql`;        -- Seed entities
SOURCE `7. RelationshipPopulation.sql`;  -- Seed relationships
SOURCE `8. Rankings.sql`;               -- Ranking procedures
SOURCE `9. LoadBalancing.sql`;          -- Load-balancing procedures
SOURCE `10. Events.sql`;                -- Scheduled events
SOURCE `11. AdditionalAnalytics.sql`;   -- Extra analytics
```

> **Shortcut:** `QuickStart.sql` combines all of the above into a single file.

---

## Database Schema

The schema is organised into **four thematic areas**, each designed to be internally cohesive while remaining tightly integrated with the others. Achieving clean boundaries between areas — without sacrificing join efficiency — was one of the central design challenges.

### 1. Film, Cast & Awards

| Table | Description |
|---|---|
| `Film` | Core film entity (country, release year, cached rating and review count) |
| `CastMember` | Cast member (fiscal code, role: Actor/Actress/Director, name) |
| `Participation` | Film ↔ CastMember link |
| `FilmDescription` | Localised title and description (film × language) |
| `Language` | Available languages |
| `Genre` | Film genres |
| `Membership` | Film ↔ Genre mapping |
| `Dubbing` | Dubbed language tracks for each film |
| `Subtitle` | Subtitle tracks for each film |
| `Critic` | Film critics |
| `CriticReview` | Critic review (score 0–10, date) |
| `FilmAward` | Film award types (name + category) |
| `CastAward` | Cast award types (name + category) |
| `FilmAwarding` | Film ↔ Award win (with year) |
| `CastAwarding` | CastMember ↔ Award win (with year) |

### 2. Formats, States & Restrictions

| Table | Description |
|---|---|
| `VideoFormat` | Video format (resolution, bitrate, aspect ratio) |
| `AudioFormat` | Audio format (format name, quality index 0–5) |
| `Format` | Film in a specific VideoFormat+AudioFormat combination |
| `Codec` | Codec software (name, type: Audio/Video, distribution date) |
| `VideoVersion` | Codec → VideoFormat decoding support |
| `AudioVersion` | Codec → AudioFormat decoding support |
| `GeoState` | Geographic state/country (IP-based identifier) |
| `VideoRestriction` | VideoFormat blocked in a state |
| `AudioRestriction` | AudioFormat blocked in a state |
| `Hardware` | Hardware component model and type |
| `VideoEncoding` | Hardware → Video codec support |
| `AudioEncoding` | Hardware → Audio codec support |

### 3. Users, Devices & Plans

| Table | Description |
|---|---|
| `Profile` | User profile (code, name, email, nickname, password hash) |
| `Plan` | Subscription plans (name, max hours, max GB, cost) |
| `Feature` | Plan features/capabilities |
| `Subscription` | Profile ↔ Plan link |
| `Offering` | Plan ↔ Feature mapping |
| `Device` | Physical device (type, display language) |
| `Interface` | Profile ↔ Device access |
| `Composition` | Device ↔ Hardware components |
| `Invoice` | Invoice (issue date, expiry date, plan) |
| `Card` | Payment card |
| `Paid` | Paid invoices |
| `ToPay` | Outstanding invoices |
| `Payment` | Invoice ↔ Card payment |
| `UserReview` | User film review (score 0–5, date) |
| `Viewing` | Film viewing record (profile, film, format, date) |
| `Download` | Film download record |
| `RecommendedFilms` | Personalised film recommendations |

### 4. Servers & Streaming

| Table | Description |
|---|---|
| `StreamingServer` | CDN streaming server (IP, bandwidth, capacity, current load) |
| `ConnectionHistory` | Connection history (device ↔ server, timestamps) |
| `GeoIndexing` | Connection ↔ Geographic state mapping |
| `PointOfPresence` | Server ↔ Film availability (CDN catalogue) |

---

## Key Features

### Business Rules (`3. BusinessRule.sql`)

Eleven triggers guard all data integrity constraints automatically:

| Trigger | Event | Description |
|---|---|---|
| `TrgAwardYear` | BEFORE INSERT on `FilmAwarding` | Auto-fills win year from film release year if null |
| `TrgCheckQualityIndex` | BEFORE INSERT on `AudioFormat` | Rejects quality index outside 0–5 |
| `TrgCheckReview` | BEFORE INSERT on `UserReview` | Validates review date and score; updates cached rating |
| `TrgCheckPlanCost` | BEFORE INSERT on `Plan` | Rejects negative plan costs |
| `TrgCheckBitrate` | BEFORE INSERT on `VideoFormat` | Rejects negative bitrate values |
| `TrgCheckCriticReview` | BEFORE INSERT on `CriticReview` | Validates critic score range (0–10) |
| `TrgAddGeoIndexing` | AFTER INSERT on `ConnectionHistory` | Auto-creates a `GeoIndexing` entry on new connection |
| `TrgCheckCastRole` | BEFORE INSERT on `CastMember` | Restricts role to `Actor`, `Actress`, `Director` |
| `TrgCheckCodecType` | BEFORE INSERT on `Codec` | Restricts codec type to `Audio` or `Video` |
| `TrgUpdateServerLoad` | AFTER INSERT on `ConnectionHistory` | Increments `CurrentLoad` on the target server |
| `TrgRemoveWatchedRecommendations` | AFTER INSERT on `Viewing` | Removes a just-watched film from `RecommendedFilms` |

### Core Stored Procedures (`4. Procedure.sql`)

| Procedure | Description |
|---|---|
| `FilmOfTheDay()` | Most-watched film of the current day |
| `GenresAboveRatingThree()` | Genres whose films average a rating above 3 |
| `FindServerForDevice(deviceId, deviceIp, filmId)` | Nearest CDN server with the lowest load hosting the requested film |
| `FindCriticReviews(criticId, date)` | All critic reviews after a given date |
| `CreateAccount(...)` | Creates a new profile with subscription, invoice, and card |
| `CheckServer(serverIp)` | Returns current connection count and load percentage for a server |
| `CastPopularity(fiscalCode, role)` | Weighted popularity score: film rating (×5), film awards (×4), personal awards (×7) |
| `InsertUserReview(filmId, profileCode, score)` | Inserts a user film review with full validation |
| `StartConnection(...)` | Opens a new streaming connection, checking server capacity |
| `EndConnection(...)` | Closes an open streaming connection and decrements server load |

### Recommendation System (`2. RecommendedFilms.sql`)

Two procedures populate `RecommendedFilms` daily:

- **`RecommendFilmsByGenre(userId)`** — recommends unwatched films belonging to the user's top-3 most-watched genres.
- **`RecommendFilmsByDirector(userId)`** — recommends unwatched films by directors whose films the user rated ≥ 4/5 on average.

Films are automatically removed from recommendations by `TrgRemoveWatchedRecommendations` as soon as they are watched.

### Rankings & Analytics (`8. Rankings.sql`, `9. LoadBalancing.sql`, `11. AdditionalAnalytics.sql`)

| Procedure | Description |
|---|---|
| `GlobalFilmRanking()` | Global film popularity ranking by view count |
| `MostWatchedFormats()` | Most popular VideoFormat+AudioFormat combinations |
| `MostPopularFilmByState()` | Top film per geographic state |
| `MostWatchedFilmByPlan()` | Top film per subscription plan |
| `LoadBalancing()` | Identifies overloaded servers and redistributes film streaming |
| `BalanceControl(serverIp, load, filmId)` | Migrates active streams from an overloaded server to a lighter one |
| `ManageServerLoad(serverIp, capacity, load)` | Reassigns individual user connections to available servers |
| `CheckAllServersLoad()` | Scans all servers; triggers `ManageServerLoad` when load exceeds 85% |
| `AnnualUserReport(profileCode)` | Annual statistics: hours watched, GB downloaded, top films and directors |

### Scheduled Events (`10. Events.sql`)

| Event | Schedule | Description |
|---|---|---|
| `EvtCheckServerLoad` | Every 3 minutes | Calls `CheckAllServersLoad()` to rebalance CDN traffic |
| `EvtComputeUserRecommendations` | Daily | Calls `RecommendFilmsByGenre()` for every active profile |

---

## IP-Based Geolocation

A key design decision was encoding geographic distance directly into the IP integer scheme, avoiding any external geolocation API:

- **First 4 digits** — geographic state/region identifier (`StateIP = DeviceIP - DeviceIP MOD 10000`)
- **Last 4 digits** — distance in kilometres from a reference point within the state

This lets `FindServerForDevice` compute the nearest CDN server using pure integer arithmetic, and powers the `MostPopularFilmByState` ranking by joining `ConnectionHistory` with `GeoIndexing`.

---

## Optimisation: Intentional Redundancies

Three denormalisations were introduced deliberately, each justified by a formal access-cost comparison:

| Attribute | Table | Maintained by | Benefit |
|---|---|---|---|
| `Rating` | `Film` | `TrgCheckReview` | Cached average score — avoids scanning all `UserReview` rows (cost: 304,150 → 4,150) |
| `ReviewCount` | `Film` | `TrgCheckReview` | Enables incremental rating update without a full re-aggregate |
| `CurrentLoad` | `StreamingServer` | `TrgUpdateServerLoad`, `EndConnection` | Real-time load counter — avoids counting open connections on every request (cost: 3,000,500 → 500) |

---

## Entity-Relationship Diagrams

- **`ER_Diagram_NonRestructured.drawio.pdf`** — original conceptual ER model with all generalisations intact.
- **`ER_Diagram_Restructured.drawio.pdf`** — restructured ER diagram with generalisations collapsed, redundancies added, and composite attributes decomposed; used as the direct basis for the logical schema.
