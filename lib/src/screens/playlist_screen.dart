import 'package:emolist/src/constants/emotion.dart';
import 'package:emolist/src/models/diary_model.dart';
import 'package:emolist/src/models/track_model.dart';
import 'package:emolist/widgets/track_widget.dart';
import 'package:flutter/material.dart';

class PlaylistScreen extends StatelessWidget {
  final List<DiaryModel> dummydiaries = [
    DiaryModel(
      id: '1',
      date: DateTime(2022, 3, 1),
      content: '가나다라마바사아자차카타파하',
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
        const TrackModel(
            id: '1',
            title: 'd',
            artists: ['d'],
            cover: 'assets/images/trackImage.png',
            liked: true),
        const TrackModel(
            id: '1',
            title: 'd',
            artists: ['d'],
            cover: 'assets/images/trackImage.png',
            liked: false),
      ],
    ),
    DiaryModel(
      id: '1',
      date: DateTime(2024, 3, 2),
      content:
          '가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하',
      emotions: {
        Emotion.love: 0.41,
        Emotion.happiness: 0.21,
        Emotion.anger: 0.17,
        Emotion.sadness: 0.13,
        Emotion.hurt: 0.08,
      },
      playlist: const [
        TrackModel(
            id: '1',
            title: 'Butter',
            artists: ['d'],
            cover: 'assets/images/trackImage.png',
            liked: true),
        TrackModel(
            id: '1',
            title: 'Good Day',
            artists: ['d'],
            cover: 'assets/images/trackImage.png',
            liked: false),
        TrackModel(
            id: '1',
            title: 'Happiness',
            artists: ['d'],
            cover: 'assets/images/trackImage.png',
            liked: true),
      ],
    ),
    DiaryModel(
      id: '1',
      date: DateTime(2024, 3, 2),
      content:
          '가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하',
      emotions: {
        Emotion.love: 0.41,
        Emotion.happiness: 0.21,
        Emotion.anger: 0.17,
        Emotion.sadness: 0.13,
        Emotion.hurt: 0.08,
      },
      playlist: const [
        TrackModel(
            id: '1',
            title: 'Butter',
            artists: ['d'],
            cover: 'assets/images/trackImage.png',
            liked: true),
        TrackModel(
            id: '1',
            title: 'Good Day',
            artists: ['d'],
            cover: 'assets/images/trackImage.png',
            liked: false),
        TrackModel(
            id: '1',
            title: 'Happiness',
            artists: ['d'],
            cover: 'assets/images/trackImage.png',
            liked: true),
      ],
    )
  ];
  // ignore: use_super_parameters
  PlaylistScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.35;
    if (dummydiaries.isEmpty) {
      return const Scaffold(
        body: Center(
          child: Text(
            '플레이리스트가 없습니다.',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
    return Scaffold(
        body: ListView.builder(
      itemCount: dummydiaries.length,
      itemBuilder: (context, index) {
        final diary = dummydiaries[index];

        final formattedDate = '${diary.date.year}.${diary.date.month}';

        final bool isFirstOrDifferentMonth = index == 0 ||
            formattedDate !=
                '${dummydiaries[index - 1].date.year}.${dummydiaries[index - 1].date.month}';

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isFirstOrDifferentMonth)
              _buildDateDivider(formattedDate, width),
            for (final track in diary.playlist)
              Track(
                  id: track.id,
                  title: track.title,
                  artists: track.artists,
                  cover: track.cover,
                  liked: track.liked)
          ],
        );
      },
    ));
  }

  Widget _buildDateDivider(String formattedDate, double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1,
          width: width,
          color: Colors.grey,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          formattedDate,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 1,
          width: width,
          color: Colors.grey,
        ),
      ],
    );
  }

  ListView makeTrackList(List<TrackModel> tracks) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: tracks.length,
      itemBuilder: (context, index) {
        var track = tracks[index];
        return Track(
            id: track.id,
            title: track.title,
            artists: track.artists,
            cover: track.cover,
            liked: track.liked);
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
    );
  }
}
