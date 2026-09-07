# Sportify — AI-Powered Football Talent Discovery

> A focused prototype of the **Sportify** platform, built as a 24-hour technical assessment. It demonstrates a premium mobile-first UI, clean architecture, and production-ready code structure for an AI football scouting product.

---

## ?? Live Demo

?? **[Open Live Demo](https://MustafaAmmarD.github.io/sportify)**

> Built with Flutter Web and deployed via GitHub Pages.

---

## ?? Screens

| Screen | Description |
|---|---|
| **Splash** | Animated brand intro with logo and progress indicator |
| **Discover** | Hero player carousel, Highlight Reels, searchable player grid |
| **Player Profile** | Full profile with AI Fit Score, career timeline, stats, highlight placeholder |
| **AI Scouting** | Filter by position, age, foot, budget ? ranked results with AI score |

---

## ??? Architecture

The project follows **Feature-First Clean Architecture**:

```
lib/
+-- core/               # Theme, colors, text styles, constants
+-- data/               # Models, repository interface & mock implementation
¦   +-- models/         # Player, CareerEntry, PlayerStats, ScoutingFilter
¦   +-- mock/           # Static mock player data
¦   +-- repositories/   # PlayerRepository interface + MockPlayerRepository
+-- providers/          # All Riverpod providers (single source of truth)
+-- screens/            # Feature-first screen folders
¦   +-- splash/
¦   +-- discover/
¦   +-- player_profile/
¦   +-- scouting/
+-- widgets/            # Shared, reusable UI components
```

**Key decisions:**
- Feature-first folder structure keeps each screen self-contained and scalable
- Repository pattern allows the entire data layer to be swapped without any UI changes
- GoRouter handles navigation with named routes and deep-linking support

---

## ?? State Management

**Riverpod 3.x** with the modern `Notifier` / `FutureProvider` pattern.

### Performance Optimisations (found via DevTools profiling)

1. **Search Debouncing**: Two-provider pattern — `searchQueryProvider` (instant, drives TextField) and `debouncedSearchQueryProvider` (fires 400ms after typing stops, drives the expensive player list rebuild). Eliminates jank on every keystroke.

2. **Scouting Filter Decoupling**: `scoutingFilterProvider` (live UI state) is separate from `activeScoutingFilterProvider` (committed on "Find Players" tap). Dragging sliders no longer triggers full-screen rebuilds.

---

## ?? API / Data Approach

### Current: Mock Data
All data is served from static Dart objects in `lib/data/mock/mock_players.dart` — 9 realistic player profiles with full career histories, AI scores, and stats.

### Ready for Laravel Integration
The repository pattern means connecting to the real backend requires changing **one line**:

```dart
// In providers.dart — swap mock ? real:
final playerRepositoryProvider = Provider<PlayerRepository>((ref) {
  return LaravelPlayerRepository(baseUrl: 'https://api.sportify.com');
});
```

`Player.fromJson()` factory constructors are already implemented across all models, ready to parse real API responses.

---

## ??? Main Technical Decisions

| Decision | Rationale |
|---|---|
| Flutter cross-platform | Single codebase ? Android, iOS, Web (GitHub Pages) |
| Slivers for scrolling | `CustomScrollView` + `SliverList` is the highest-performance scroll approach in Flutter |
| Responsive breakpoints | MediaQuery at >800px switches to a two-column layout — no third-party packages |
| AppImage widget | Centralises image loading: CachedNetworkImage for remote, Image.asset() for local, graceful error fallback for both |
| Video placeholder | SnackBar on tap + real player photo with dark overlay mimics a video thumbnail without the complexity/bugs of a real player |

---

## ?? What I Would Improve With One More Week

**High Priority**
- Real Laravel API integration via `Dio` + repository swap
- Actual video playback using `video_player` or `better_player`
- Auth flow (login/signup) with JWT using `flutter_secure_storage`

**Medium Priority**
- Push notifications (Firebase Cloud Messaging) for player status changes
- Favourites / Shortlist with local persistence (`Hive`)
- Skeleton loading screens using `shimmer` package
- Unit & widget tests using `flutter_test` + `mocktail`

**Polish**
- Offline support via cached last-fetched data
- Arabic i18n support (given the target market)
- More advanced search filters (nationality, league, value range)

---

## ?? Getting Started

```bash
git clone https://github.com/your-username/sportify.git
cd sportify
flutter pub get
flutter run
```

**Requirements**: Flutter SDK 3.29+, Dart 3.7+

---

## ?? Key Dependencies

| Package | Purpose |
|---|---|
| `flutter_riverpod ^3.3.2` | State management |
| `go_router ^17.0.0` | Navigation & deep-linking |
| `cached_network_image ^3.4.1` | Network image caching |
| `google_fonts ^6.3.2` | Typography |
| `flutter_animate ^4.5.2` | Micro-animations |
| `flutter_launcher_icons ^0.13.1` | App icon generation |
