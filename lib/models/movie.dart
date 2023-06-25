import 'package:flutter/foundation.dart' show immutable;

//Movie Object
@immutable
class Movie {
  final String title;
  final String releaseDate;
  final String overview;
  final num? vote;
  final String? posterUrl;
  final bool saveToFavourite;

  const Movie({
    required this.title,
    required this.releaseDate,
    required this.overview,
    required this.vote,
    this.saveToFavourite = false,
    required this.posterUrl,
  });
  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        title: json['title'] as String,
        releaseDate: json['release_date'] as String,
        overview: json['overview'] as String,
        vote: json['vote_average'] as num,
        posterUrl: json['poster_path'] as String,
      );

  Movie copyWith({
    String? title,
    String? releaseDate,
    String? overview,
    num? vote,
    String? posterUrl,
    bool? saveToFavourite,
  }) =>
      Movie(
        title: title ?? this.title,
        releaseDate: releaseDate ?? this.releaseDate,
        overview: overview ?? this.overview,
        vote: vote ?? this.vote,
        posterUrl: posterUrl ?? this.posterUrl,
        saveToFavourite: saveToFavourite ?? this.saveToFavourite,
      );

  @override
  bool operator ==(covariant Movie other) =>
      title == other.title &&
      releaseDate == other.releaseDate &&
      overview == other.overview &&
      vote == other.vote &&
      saveToFavourite == other.saveToFavourite &&
      posterUrl == other.posterUrl;

  @override
  int get hashCode => Object.hashAll(
        [
          title,
          releaseDate,
          overview,
          vote,
          saveToFavourite,
          posterUrl,
        ],
      );

  @override
  String toString() => {
        'Title': title,
        'Overview': overview,
        'Release Date': releaseDate,
        'Poster': posterUrl,
        'Save To Favourite': saveToFavourite,
      }.toString();
}
