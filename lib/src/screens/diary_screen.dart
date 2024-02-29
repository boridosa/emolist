import 'package:emolist/src/constants/emotion.dart';
import 'package:emolist/src/models/diary_model.dart';
import 'package:emolist/src/models/track_model.dart';
import 'package:emolist/widgets/diary_widget.dart';
import 'package:flutter/material.dart';

class DiaryScreen extends StatelessWidget {
  //final DateTime currentDate;
  // ignore: use_super_parameters
  const DiaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    final selectedYear = selectedDate.year;
    final selectedMonth = selectedDate.month;
    final List<DiaryModel> dummydiaries = [
      DiaryModel(
        id: '1',
        date: DateTime.now(),
        content: '가나다라마바사아자차카타파하',
        emotions: {
          Emotion.love: 0.33,
          Emotion.happiness: 0.21,
          Emotion.anger: 0.17,
          Emotion.sadness: 0.13,
          Emotion.hurt: 0.08,
          Emotion.fear: 0.06,
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
        date: DateTime.now(),
        content:
            '가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하',
        emotions: {
          Emotion.love: 0.33,
          Emotion.happiness: 0.21,
          Emotion.anger: 0.17,
          Emotion.sadness: 0.13,
          Emotion.hurt: 0.08,
          Emotion.fear: 0.06,
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
        date: DateTime.now(),
        content: '가나다라마바사아자차카타파하',
        emotions: {
          Emotion.love: 0.33,
          Emotion.happiness: 0.21,
          Emotion.anger: 0.17,
          Emotion.sadness: 0.13,
          Emotion.hurt: 0.08,
          Emotion.fear: 0.06,
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
              liked: true),
        ],
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1D1D1D),
        elevation: 2,
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                firstDate: DateTime(2015),
                lastDate: DateTime(2099),
                initialDatePickerMode: DatePickerMode.year,
              );
              if (pickedDate != null && pickedDate != selectedDate) {
                selectedDate = pickedDate;
              }
            },
            child: Text(
              '$selectedYear년 $selectedMonth월',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: makeDiaryList(dummydiaries),
          ),
        ],
      ),
    );
  }

  ListView makeDiaryList(List<DiaryModel> diaries) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: diaries.length,
      itemBuilder: (context, index) {
        var diary = diaries[index];
        return Diary(
            id: diary.id,
            date: diary.date,
            content: diary.content,
            emotions: diary.emotions,
            playlist: diary.playlist);
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 15,
      ),
    );
  }
}
