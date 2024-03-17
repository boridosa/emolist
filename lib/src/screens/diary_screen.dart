import 'package:emolist/src/constants/emotion.dart';
import 'package:emolist/src/models/diary_model.dart';
import 'package:emolist/src/models/track_model.dart';
import 'package:emolist/widgets/diary_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiaryScreen extends StatefulWidget {
  //final DateTime currentDate;
  // ignore: use_super_parameters
  final DiaryModel? newDiaryContent;
  const DiaryScreen({super.key, this.newDiaryContent});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  late DateTime selectedDate;
  late String formattedDate;
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
      date: DateTime(
        2024,
        3,
      ),
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
            liked: true),
      ],
    ),
  ];
  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    formattedDate = DateFormat('yyyy년 MM월').format(selectedDate);
    if (widget.newDiaryContent != null) {
      dummydiaries.add(widget.newDiaryContent!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1D1D1D),
        elevation: 2,
        title: TextButton(
          onPressed: () async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              firstDate: DateTime(2015),
              lastDate: DateTime(2099),
              initialDatePickerMode: DatePickerMode.year,
            );
            if (pickedDate != null && pickedDate != selectedDate) {
              setState(() {
                selectedDate = pickedDate;
                formattedDate = DateFormat('yyyy년 MM월').format(selectedDate);
              });
            }
          },
          child: Text(
            formattedDate,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: makeDiaryList(dummydiaries, selectedDate),
          ),
        ],
      ),
    );
  }

  ListView makeDiaryList(List<DiaryModel> diaries, DateTime selectedDate) {
    final filteredDiaries = diaries
        .where((diary) =>
            diary.date.year == selectedDate.year &&
            diary.date.month == selectedDate.month)
        .toList();
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: filteredDiaries.length,
      itemBuilder: (context, index) {
        var diary = filteredDiaries[index];
        return Diary(
          id: diary.id,
          date: diary.date,
          content: diary.content,
          emotions: diary.emotions,
          playlist: diary.playlist,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 15,
      ),
    );
  }
}
