final String tableMovies = 'movies';

class MovieFields {
  static final List<String> values = [
    /// Add all fields
    id, title, year, time, poster,type,imdbID
  ];

  /*String? title;
  String? year;
  String? imdbID;
  String? type;
  String? poster;*/

  static final String id = '_id';
  static final String title = 'title';
  static final String poster = 'poster';
  static final String year = 'year';
  static final String time = 'time';
  static final String type = 'type';
  static final String imdbID = 'imdbID';
}

class Moviedb {
  final int? id;
  final String title;
  final String poster;
  final String year;
  final DateTime createdTime;
  final String type;
  final String imdbID;

  const Moviedb({
    this.id,
    required this.title,
    required this.poster,
    required this.year,
    required this.createdTime,
    required this.type,
    required this.imdbID,
  });

  Moviedb copy({
    int? id,
    String? title,
    String? poster,
    String? year,
    DateTime? createdTime,
    String? type,
    String? imdbID,
  }) =>
      Moviedb(
        id: id ?? this.id,
        title: title ?? this.title,
        poster: poster ?? this.poster,
        year: year ?? this.year,
        createdTime: createdTime ?? this.createdTime,
        type: type ?? this.type,
        imdbID: imdbID ?? this.imdbID,
      );

  static Moviedb fromJson(Map<String, Object?> json) => Moviedb(
    id: json[MovieFields.id] as int?,
    title: json[MovieFields.title] as String,
    poster: json[MovieFields.poster] as String,
    year: json[MovieFields.year] as String,
    createdTime: DateTime.parse(json[MovieFields.time] as String),
    type: json[MovieFields.type] as String,
    imdbID: json[MovieFields.imdbID] as String,
  );

  Map<String, Object?> toJson() => {
    MovieFields.id: id,
    MovieFields.title: title,
    MovieFields.poster: poster,
    MovieFields.year: year,
    MovieFields.time: createdTime.toIso8601String(),
    MovieFields.type: type,
    MovieFields.imdbID: imdbID,
  };
}