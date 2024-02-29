import 'package:emolist/src/models/track_model.dart';
import 'package:emolist/widgets/track_widget.dart';
import 'package:flutter/material.dart';

class PlaylistScreen extends StatelessWidget {
  final List<TrackModel> dummytracks;

  // ignore: use_super_parameters
  const PlaylistScreen({Key? key})
      : dummytracks = const [
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
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: makeTrackList(dummytracks)),
        ],
      ),
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
