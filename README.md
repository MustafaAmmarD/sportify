# Sportify — Flutter Football Talent Discovery

A functional Flutter prototype of the Sportify football talent discovery app, built for a technical task. It features a dark, professional football aesthetic with 3 main screens: Discover, Player Profile, and AI Club Scouting.

## 🏗 Architecture

The app follows a clean architecture pattern with a clear separation of concerns, designed to be scalable and maintainable:

- **Data Layer:** Contains data models (`Player`, `ScoutingFilter`), a mock data source (`mock_players.dart`), and a repository pattern (`PlayerRepository`) to abstract data access. This makes it trivial to swap the mock data with a real Laravel REST API backend later.
- **State Layer:** Utilizes Riverpod for dependency injection and state management. The state is decentralized into domain-specific providers (e.g., `scoutingFilterProvider`, `searchResultsProvider`).
- **Presentation Layer:** Built with a component-based approach using reusable widgets. The navigation is handled by GoRouter with a `ShellRoute` for the bottom navigation bar.

## ⚙️ State Management

This project uses **Riverpod 3.x** for state management. Riverpod was chosen because it is modern, compile-safe, testable, and highly recommended for scalable Flutter applications.

- **Notifiers:** `NotifierProvider` is used for states that can change (e.g., search queries, scouting filters).
- **FutureProviders:** Used for asynchronous data fetching (e.g., loading players). They seamlessly handle loading, error, and data states, allowing the UI to react gracefully without manual `setState` management.

## 📡 API / Data Approach

- **Repository Pattern:** An abstract `PlayerRepository` interface is defined, currently implemented by `MockPlayerRepository`. This mock repository introduces simulated network delays to mimic real-world API behavior.
- **Mock Data:** Comprehensive mock JSON data is provided for 12 realistic players. The data includes full biographies, career histories, stats, and AI fit score reasoning.
- **Future Integration:** To connect this to a Laravel backend, you would simply implement a new `ApiPlayerRepository` that implements the `PlayerRepository` interface using the `http` or `dio` package, and swap the provider injection in `providers.dart`.

## 🛠 Main Technical Decisions

1. **Design System:** Implemented a unified dark theme with an emerald green (pitch) and gold (AI/premium) color palette. Used Google Fonts (`Outfit` for headings, `Inter` for body) to give it a modern, sporty feel inspired by apps like Wyscout and Nike Football.
2. **GoRouter:** Chosen for declarative routing. It supports web URLs nicely (crucial for the live demo) and makes shell routing (bottom navigation) very clean.
3. **Animations:** Added subtle hover effects, hero animations, and custom animated circular progress indicators (for the AI score) to make the app feel dynamic and premium, avoiding the "generic dashboard" feel.

## 🚀 Running Locally

Ensure you have Flutter installed (built and tested on Flutter 3.29+).

```bash
flutter pub get
flutter run -d chrome
```

## 📈 Future Improvements (With Another Week)

1. **Backend Integration:** Replace the mock repository with a real REST API integration using `dio` and generate data classes with `freezed` and `json_serializable`.
2. **Video Player Integration:** Replace the highlight video placeholders with an actual video player (e.g., `video_player` or `youtube_player_flutter`) to play reels inline.
3. **Advanced Animations:** Add page transition animations, stagger list animations upon loading, and more micro-interactions on the buttons and cards.
4. **Testing:** Write comprehensive unit tests for the notifiers and widget tests for the core reusable components.
