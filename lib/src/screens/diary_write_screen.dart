import 'package:emolist/src/constants/emotion.dart';
import 'package:emolist/src/models/diary_model.dart';
import 'package:emolist/src/models/track_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class DiaryWriteScreen extends StatefulWidget {
  final String id;
  DateTime date;
  final String content;
  final Map<Emotion, double> emotions;
  final List<TrackModel> playlist;

  DiaryWriteScreen(
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
    String formattedDate = DateFormat('yyyy.MM.dd E').format(widget.date);
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
                emotions: {},
                playlist: [],
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
                Row(
                  children: [
                    Text(
                      formattedDate,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime(2015),
                          lastDate: DateTime(2099),
                          initialDatePickerMode: DatePickerMode.year,
                        );
                        if (pickedDate != null && pickedDate != widget.date) {
                          setState(() {
                            widget.date = pickedDate;
                            formattedDate =
                                DateFormat('yyyy.MM.dd E').format(widget.date);
                          });
                        }
                      },
                      icon: const FaIcon(FontAwesomeIcons.pen),
                    ),
                  ],
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
