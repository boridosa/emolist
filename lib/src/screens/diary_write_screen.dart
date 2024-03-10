import 'package:emolist/src/constants/emotion.dart';
import 'package:emolist/src/models/diary_model.dart';
import 'package:emolist/src/models/track_model.dart';
import 'package:flutter/material.dart';

class DiaryWriteScreen extends StatefulWidget {
  final String id;
  final DateTime date;
  final String content;
  final Map<Emotion, double> emotions;
  final List<TrackModel> playlist;

  const DiaryWriteScreen(
      {super.key,
      required this.id,
      required this.date,
      required this.content,
      required this.emotions,
      required this.playlist});

  @override
  State<DiaryWriteScreen> createState() => _DiaryWriteScreenState();
}

class _DiaryWriteScreenState extends State<DiaryWriteScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.text = widget.content;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.grey),
        backgroundColor: const Color(0xFF252525),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              final newDiary = DiaryModel(
                id: 'id',
                date: DateTime.now(),
                content: _controller.text,
                emotions: const {},
                playlist: const [],
              );
              Navigator.pop(context, newDiary);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
            child: const Text(
              '완료',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.date}',
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Text(
                //   widget.content,
                //   style: const TextStyle(fontSize: 12, color: Colors.white),
                // ),
                TextField(
                  controller: _controller,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
