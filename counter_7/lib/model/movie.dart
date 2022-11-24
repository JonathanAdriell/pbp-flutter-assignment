import 'dart:convert';

List<Movie> movieFromJson(String str) =>
    List<Movie>.from(json.decode(str).map((x) => Movie.fromJson(x)));

String movieToJson(List<Movie> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Movie {
  Movie({
    required this.watched,
    required this.title,
    required this.rating,
    required this.releaseDate,
    required this.review,
  });

  bool watched;
  String title;
  int rating;
  String releaseDate;
  String review;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
      watched: json["fields"]["watched"],
      title: json["fields"]["title"],
      rating: json["fields"]["rating"],
      releaseDate: json["fields"]["release_date"],
      review: json["fields"]["review"]);

  Map<String, dynamic> toJson() => {
    "watched": watched,
    "title": title,
    "rating": rating,
    "releaseDate": releaseDate,
    "review": review
  };
}