class TrackModel {
  final String id;
  final String title;
  final List<String> artists;
  final String coverImageUri;
  final bool liked;

  TrackModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        artists = List.from(json['artists']),
        coverImageUri = json['coverImageUri'],
        liked = json['liked'];
}
