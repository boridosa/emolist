import 'package:emolist/src/constants/emotion.dart';
import 'package:emolist/src/models/track_model.dart';
import 'package:emolist/src/screens/diary_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// 홈화면 플레이리스트 부분에 들어갈 위젯
class Playlist extends StatelessWidget {
  final String id;
  final DateTime date;
  final String content;
  final Map<Emotion, double> emotions;
  final List<TrackModel> playlist;

  const Playlist(
      {super.key,
      required this.id,
      required this.date,
      required this.content,
      required this.emotions,
      required this.playlist});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('MM월 DD일').format(date);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DiaryDetailScreen(
                    id: id,
                    date: date,
                    content: content,
                    emotions: emotions,
                    playlist: playlist)));
      },
      child: Column(
        children: [
          Container(
            width: 100,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.transparent,
            ),
            child: Image.asset(playlist[0].cover),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            formattedDate,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
