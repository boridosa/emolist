import 'package:emolist/src/constants/emotion.dart';
import 'package:emolist/src/models/diary_model.dart';
import 'package:emolist/src/models/track_model.dart';
import 'package:emolist/theme/colors.dart';
import 'package:emolist/widgets/playlist_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  final List<DiaryModel> dummyplaylists;
  // ignore: use_super_parameters
  HomeScreen({Key? key})
      : dummyplaylists = [
          DiaryModel(
              id: '1',
              date: DateTime(2024, 2, 16),
              content: 'ㅎㅎ',
              emotions: {
                Emotion.love: 0.41,
                Emotion.happiness: 0.21,
                Emotion.anger: 0.17,
                Emotion.sadness: 0.13,
                Emotion.hurt: 0.08,
              },
              playlist: [
                const TrackModel(
                    id: '1',
                    title: 'd',
                    artists: ['d'],
                    cover: 'assets/images/trackImage.png',
                    liked: true),
              ]),
          DiaryModel(
              id: '1',
              date: DateTime(2024, 2, 15),
              content: 'ㅎㅎ',
              emotions: {
                Emotion.love: 0.41,
                Emotion.happiness: 0.21,
                Emotion.anger: 0.17,
                Emotion.sadness: 0.13,
                Emotion.hurt: 0.08,
              },
              playlist: [
                const TrackModel(
                    id: '1',
                    title: 'd',
                    artists: ['d'],
                    cover: 'assets/images/trackImage.png',
                    liked: true),
              ]),
        ],
        super(key: key);
  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    DateTime oneYearAgo =
        DateTime(currentDate.year - 1, currentDate.month, currentDate.day - 1);
    String formattedDate =
        '${DateFormat('yyyy.MM.dd').format(oneYearAgo)} ~ ${DateFormat('yyyy.MM.dd').format(currentDate)}';

    final width = MediaQuery.of(context).size.width * 0.75;
    const double height = 24;
    final borderRadius = BorderRadius.circular(10);
    final emotions = {
      Emotion.love: 0.21,
      Emotion.happiness: 0.41,
      Emotion.anger: 0.17,
      Emotion.sadness: 0.13,
      Emotion.hurt: 0.08,
    };

    double maxEmotionValue = 0;
    Emotion? maxEmotion;
    emotions.forEach((emotion, value) {
      if (value > maxEmotionValue) {
        maxEmotionValue = value;
        maxEmotion = emotion;
      }
    });

    String message = '';
    if (maxEmotion != null) {
      message = '지난 1년동안 ${emotionToString(maxEmotion!)} 가장 많이 느끼셨군요!';
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '홈',
          style: TextStyle(color: Colors.white, fontSize: 32),
        ),
        backgroundColor: black01,
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

          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                const Text(
                  'EMOTION',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  formattedDate,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: grey02),
                ),
              ],
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
          Center(
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.green,
              ),
            ),
          ),
          const SizedBox(
            height: 70,
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
                        color: black03,
                      ),
                    ),
                    Container(
                      width: width * entry.value,
                      height: height,
                      decoration: BoxDecoration(
                        borderRadius: borderRadius,
                        color: green01,
                      ),
                    ),
                    SizedBox(
                      width: width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          '${(entry.value * 100).round()}%',
                          textAlign: TextAlign.end,
                          style: const TextStyle(color: grey02),
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

  String emotionToString(Emotion emotion) {
    switch (emotion) {
      case Emotion.love:
        return '사랑을';
      case Emotion.happiness:
        return '행복을';
      case Emotion.anger:
        return '분노를';
      case Emotion.sadness:
        return '슬픔을';
      case Emotion.hurt:
        return '상처를';
      default:
        return '알 수 없는 감정';
    }
  }

  ListView makePlayList(List<DiaryModel> playlists) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: playlists.length,
      itemBuilder: (context, index) {
        var playlist = playlists[index];
        return Playlist(
            id: playlist.id,
            date: playlist.date,
            content: playlist.content,
            emotions: playlist.emotions,
            playlist: playlist.playlist);
      },
      separatorBuilder: (context, index) => const SizedBox(width: 20),
    );
  }
}
