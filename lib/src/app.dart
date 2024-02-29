import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'constants/route_path.dart';
import 'screens/diary_screen.dart';
import 'screens/home_screen.dart';
import 'screens/main_screen.dart';
import 'screens/playlist_screen.dart';

final mainNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'main shell');

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Emolist',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        scaffoldBackgroundColor: const Color(0xFF252525),
        useMaterial3: true,
      ),
      routerConfig: GoRouter(
        debugLogDiagnostics: true,
        initialLocation: RoutePath.home.path,
        routes: [
          _createMainRoute(),
        ],
      ),
    );
  }

  RouteBase _createMainRoute() {
    return ShellRoute(
      navigatorKey: mainNavigatorKey,
      builder: (context, state, child) => MainScreen(
        body: child,
        currentPath: state.uri.path,
      ),
      routes: [
        _createHomeRoute(
          parentNavigatorKey: mainNavigatorKey,
        ),
        _createDiaryRoute(
          parentNavigatorKey: mainNavigatorKey,
        ),
        _createPlaylistRoute(
          parentNavigatorKey: mainNavigatorKey,
        ),
      ],
    );
  }

  RouteBase _createHomeRoute({
    GlobalKey<NavigatorState>? parentNavigatorKey,
  }) {
    return GoRoute(
      path: RoutePath.home.path,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const HomeScreen(),
      ),
      parentNavigatorKey: parentNavigatorKey,
    );
  }

  RouteBase _createDiaryRoute({
    GlobalKey<NavigatorState>? parentNavigatorKey,
  }) {
    return GoRoute(
      path: RoutePath.diary.path,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const DiaryScreen(),
      ),
      parentNavigatorKey: parentNavigatorKey,
    );
  }

  RouteBase _createPlaylistRoute({
    GlobalKey<NavigatorState>? parentNavigatorKey,
  }) {
    return GoRoute(
      path: RoutePath.playlist.path,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const PlaylistScreen(),
      ),
      parentNavigatorKey: parentNavigatorKey,
    );
  }
}
