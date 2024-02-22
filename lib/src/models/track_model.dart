class TrackModel {
  final String id;
  final String title;
  final List<String> artists;
  final String cover;
  final bool liked;

  TrackModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        artists = List.from(json['artists']),
        cover = json['cover'],
        liked = json['liked'];
}
