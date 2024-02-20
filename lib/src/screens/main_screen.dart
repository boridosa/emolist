import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatelessWidget {
  final Widget body;

  const MainScreen({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    const selectedIndex = 0;

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
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          if (kDebugMode) {
            print(index);
          }
        },
      ),
      floatingActionButton: switch (selectedIndex) {
        0 || 1 => FloatingActionButton(
            onPressed: () {},
            tooltip: '일기 작성',
            child: const FaIcon(FontAwesomeIcons.pen),
          ),
        2 => FloatingActionButton(
            onPressed: () {},
            tooltip: '플레이리스트 내보내기',
            child: const FaIcon(FontAwesomeIcons.share),
          ),
        _ => null,
      },
    );
  }
}
