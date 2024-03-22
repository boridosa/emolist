import 'package:emolist/src/constants/emotion.dart';
import 'package:emolist/src/models/track_model.dart';
import 'package:emolist/src/screens/diary_detail_screen.dart';
import 'package:emolist/theme/colors.dart';
import 'package:emolist/widgets/track_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Diary extends StatelessWidget {
  final String id;
  final DateTime date;
  final String content;
  final Map<Emotion, double> emotions;
  final List<TrackModel> playlist;

  const Diary(
      {super.key,
      required this.id,
      required this.date,
      required this.content,
      required this.emotions,
      required this.playlist});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy.MM.dd E').format(date);
    final List<TrackModel> dummytracks = [
      const TrackModel(
          id: '1',
          title: '',
          artists: [],
          cover: 'assets/images/trackImage.png',
          liked: true),
    ];
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
                playlist: playlist),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: black03,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(formattedDate,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset('assets/images/trackImage.png'),
                      ),
                      //Expanded(child: makeTrackList(dummyPlaylists)),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: const BoxDecoration(
                      color: deepGrey03,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(content,
                          style: const TextStyle(color: Colors.white)),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

// 일기 카드 내에 들어갈 플레이리스트 이미지들. 중첩 스크롤 안됨
  ListView makeTrackList(List<TrackModel> playlists) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: playlists.length,
      itemBuilder: (context, index) {
        var track = playlists[index];
        return Track(
            id: track.id,
            title: track.title,
            artists: track.artists,
            cover: track.cover,
            liked: track.liked);
      },
      separatorBuilder: (context, index) => const SizedBox(width: 0),
    );
  }
}
