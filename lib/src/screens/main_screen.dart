import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../constants/route_path.dart';

class MainScreen extends StatelessWidget {
  final Widget body;
  final RoutePath currentRoute;

  MainScreen({
    super.key,
    required this.body,
    required String currentPath,
  }) : currentRoute = RoutePath.values.firstWhere(
          (route) => currentPath.startsWith(route.path),
          orElse: () => RoutePath.home,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.house),
            label: '홈',
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.book),
            label: '일기',
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.headphones),
            label: '플레이리스트',
          ),
        ],
        selectedIndex: currentRoute.index,
        onDestinationSelected: (index) {
          final destination = _getDestination(index);
          context.go(destination.path);
        },
      ),
      floatingActionButton: switch (currentRoute) {
        RoutePath.home || RoutePath.diary => FloatingActionButton(
            onPressed: () {},
            tooltip: '일기 작성',
            child: const FaIcon(FontAwesomeIcons.pen),
          ),
        RoutePath.playlist => FloatingActionButton(
            onPressed: () {},
            tooltip: '플레이리스트 내보내기',
            child: const FaIcon(FontAwesomeIcons.share),
          ),
      },
    );
  }

  RoutePath _getDestination(index) {
    return RoutePath.values.elementAtOrNull(index) ?? RoutePath.home;
  }
}
