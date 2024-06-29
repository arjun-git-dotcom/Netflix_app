class Movie {
  final int id;
  final String overview;
  final String imagePath;
  final String title;
  final String releaseDate;

  Movie(
      {required this.id,
      required this.imagePath,
      required this.title,
      required this.releaseDate,
      required this.overview});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json['id'],
        imagePath: json['poster_path'],
        title: json['title'],
        releaseDate: json['release_date'],
        overview: json['overview']);
  }
}
