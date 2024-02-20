class TrackModel {
  final String id;
  final String title;
  final List<String> artists;
  final String coverUri;
  final bool liked;

  TrackModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        artists = List.from(json['artists']),
        coverUri = json['coverUri'],
        liked = json['liked'];
}
