import 'package:emolist/src/models/diary_model.dart';
import 'package:emolist/src/screens/diary_screen.dart';
import 'package:emolist/src/screens/diary_write_screen.dart';
import 'package:emolist/theme/colors.dart';
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
        backgroundColor: black03,
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
            onPressed: () async {
              final DiaryModel? diaryContent = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DiaryWriteScreen(
                    id: 'your_id_value',
                    date: DateTime.now(),
                    content: '',
                    emotions: const {},
                    playlist: const [],
                  ),
                ),
              );
              if (diaryContent != null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DiaryScreen(newDiaryContent: diaryContent)));
              }
            },
            tooltip: '일기 작성',
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            child: const FaIcon(FontAwesomeIcons.pen),
          ),
        RoutePath.playlist => FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('멜론 플레이리스트 내보내기'),
                    content: const Text('선택한 곡을 플레이리스트로 내보내시겠습니까?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('취소'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('확인'),
                      ),
                    ],
                  );
                },
              );
            },
            tooltip: '플레이리스트 내보내기',
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            child: const FaIcon(FontAwesomeIcons.share),
          ),
      },
    );
  }

  RoutePath _getDestination(index) {
    return RoutePath.values.elementAtOrNull(index) ?? RoutePath.home;
  }
}
