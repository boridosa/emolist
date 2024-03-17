import 'package:emolist/src/constants/emotion.dart';
import 'package:emolist/src/models/track_model.dart';
import 'package:emolist/src/screens/diary_write_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiaryDetailScreen extends StatefulWidget {
  final String id;
  final DateTime date;
  String content;
  final Map<Emotion, double> emotions;
  final List<TrackModel> playlist;

  DiaryDetailScreen(
      {super.key,
      required this.id,
      required this.date,
      required this.content,
      required this.emotions,
      required this.playlist});

  @override
  State<DiaryDetailScreen> createState() => _DiaryDetailScreenState();
}

class _DiaryDetailScreenState extends State<DiaryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy.MM.dd E').format(widget.date);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.grey),
        backgroundColor: const Color(0xFF252525),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () async {
              final newContent = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DiaryWriteScreen(
                          id: widget.id,
                          date: widget.date,
                          content: widget.content,
                          emotions: widget.emotions,
                          playlist: widget.playlist)));
              if (newContent != null) {
                setState(() {
                  widget.content = newContent;
                });
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
            child: const Text(
              '수정',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: null,
      floatingActionButton: null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formattedDate,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.content,
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  '플레이리스트',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF434343),
                  ),
                  child: Column(
                    children: [
                      for (var track in widget.playlist)
                        ListTile(
                          title: Text(
                            track.title,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            track.artists.join(', '),
                            style: const TextStyle(color: Colors.white),
                          ),
                          leading: Image.asset(
                            track.cover,
                            width: 65,
                            height: 65,
                          ),
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
