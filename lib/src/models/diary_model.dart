import 'package:emolist/src/models/track_model.dart';

import '../constants/emotion.dart';

class DiaryModel {
  final String id;
  final DateTime date;
  final String content;
  final Map<Emotion, double> emotions;
  final List<TrackModel> playlist;

  DiaryModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        date = DateTime.parse(json['date']),
        content = json['content'],
        emotions = Map.fromIterables(
          Emotion.values,
          List.from(json['emotions']),
        ),
        playlist = [
          for (final track in json['playlist']) TrackModel.fromJson(track)
        ];
}
