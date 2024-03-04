import 'package:emolist/src/constants/emotion.dart';
import 'package:emolist/src/models/track_model.dart';
import 'package:emolist/widgets/playlist_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<TrackModel> dummyplaylists;
  // ignore: use_super_parameters
  const HomeScreen({Key? key})
      : dummyplaylists = const [
          TrackModel(
            id: '1',
            title: 'Song 1',
            artists: ['Artist 1'],
            cover: 'assets/images/trackImage.png',
            liked: true,
          ),
          TrackModel(
            id: '2',
            title: 'Song 2',
            artists: ['Artist 1'],
            cover: 'assets/images/trackImage.png',
            liked: true,
          ),
          TrackModel(
            id: '3',
            title: 'Song 3',
            artists: ['Artist 1'],
            cover: 'assets/images/trackImage.png',
            liked: true,
          ),
        ],
        super(key: key);
  @override
  Widget build(BuildContext context) {
    const double width = 250;
    const double height = 24;
    final borderRadius = BorderRadius.circular(10);
    final emotions = {
      Emotion.love: 0.41,
      Emotion.happiness: 0.21,
      Emotion.anger: 0.17,
      Emotion.sadness: 0.13,
      Emotion.hurt: 0.08,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '홈',
          style: TextStyle(color: Colors.white, fontSize: 32),
        ),
        backgroundColor: const Color(0xFF1D1D1D),
        elevation: 2,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 20), // 패딩 추가
            child: Text(
              'EMOLIST',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),

          Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: makePlayList(dummyplaylists)),
          ), // 더미데이터

          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'EMOTION',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          // 감정 막대 그래프
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: makeBarChart(emotions, width, height, borderRadius),
          ),
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Text(
              '지난 1년 동안 사랑을 많이 느끼셨군요!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.green,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  Column makeBarChart(Map<Emotion, double> emotions, double width,
      double height, BorderRadius borderRadius) {
    return Column(
      children: [
        for (final entry in emotions.entries)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                  child: Text(
                    entry.key.name,
                    textAlign: TextAlign.end,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 8),
                Stack(
                  children: [
                    Container(
                      width: width,
                      height: height,
                      decoration: BoxDecoration(
                        borderRadius: borderRadius,
                        color: const Color(0xff434343),
                      ),
                    ),
                    Container(
                      width: width * entry.value,
                      height: height,
                      decoration: BoxDecoration(
                        borderRadius: borderRadius,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(
                      width: width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          '${(entry.value * 100).round()}%',
                          textAlign: TextAlign.end,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
      ],
    );
  }

  ListView makePlayList(List<TrackModel> playlists) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: playlists.length,
      itemBuilder: (context, index) {
        var playlist = playlists[index];
        return Playlist(
            id: playlist.id,
            title: playlist.title,
            artists: playlist.artists,
            cover: playlist.cover,
            liked: playlist.liked);
      },
      separatorBuilder: (context, index) => const SizedBox(width: 20),
    );
  }
}
