import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'core/theme/app_theme.dart';
import 'screens/main_shell.dart';
import 'screens/player_profile/player_profile_screen.dart';
import 'screens/splash/splash_screen.dart';

class SportifyApp extends StatelessWidget {
  const SportifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Sportify — AI Football Talent Discovery',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const MainShell(),
      routes: [
        GoRoute(
          path: 'player/:id',
          builder: (context, state) {
            final playerId = state.pathParameters['id']!;
            return PlayerProfileScreen(playerId: playerId);
          },
        ),
      ],
    ),
  ],
);
