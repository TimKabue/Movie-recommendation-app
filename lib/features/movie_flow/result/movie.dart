import 'package:flutter/foundation.dart';
import 'package:movie_recommendation/features/movie_flow/genre/genre.dart';

@immutable
class Movie {
  //---Object fields
  final String title;
  final String overview;
  final num voteAverage;
  final List<Genre> genres;
  final String releaseDate;
  final String? backdropPath;
  final String? posterPath;

  //---Default Constructor
  const Movie({
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.genres,
    required this.releaseDate,
    this.backdropPath,
    this.posterPath,
  });

  //+-----------------------------------------------------------------------------------------------------------------+
  //| the : signifies the start of an initializer list.                                                               |
  //| An initializer list is a comma-separated list of assignments that initializes the instance variables of a class.|
  //| These assignments are done before the constructor body runs.                                                    |
  //+-----------------------------------------------------------------------------------------------------------------+
  //---Named Constructor.
  Movie.initial()
      : title = '',
        overview = '',
        voteAverage = 0,
        genres = [],
        releaseDate = '',
        backdropPath = '',
        posterPath = '';

  //+------------------------------------------------------------------+
  //| genresCommaSeparated is a getter that returns a string containing
  //| the names of all genres in the genres list, separated by commas.
  //| The genres list is assumed to be a list of objects where each object
  //| has a name property.
  //
  //| For example, if genres is a list like [Genre('Action'), Genre('Adventure'),
  //| Genre('Fantasy')], where Genre is a class with a name property,
  //| then genresCommaSeparated would return the string 'Action,Adventure,Fantasy'.                                |
  //+------------------------------------------------------------------+
  String get genresCommaSeparated =>
      genres.map((e) => e.name).toList().join(',');

  @override
  String toString() {
    return 'Movie(title: $title, overview: $overview, voteAverage: $voteAverage,'
        ' genres: $genres, releaseDate :$releaseDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Movie &&
        other.title == title &&
        other.overview == overview &&
        other.voteAverage == voteAverage &&
        listEquals(other.genres, genres) &&
        other.releaseDate == releaseDate;
  }

  @override
  int get hashCode =>
      title.hashCode ^
      overview.hashCode ^
      voteAverage.hashCode ^
      genres.hashCode ^
      releaseDate.hashCode;
}
