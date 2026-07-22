import 'package:go_router/go_router.dart';

import '../../shared/layout/main_shell.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MainShell(),
      ),
    ],
  );
}