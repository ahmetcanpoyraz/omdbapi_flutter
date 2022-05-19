

class MovieModel {
  List<Movie>? search;
  String? totalResults;
  String? response;

  MovieModel({this.search, this.totalResults, this.response});

  MovieModel.fromJson(Map<String, dynamic> json) {
    if (json['Search'] != null) {
      search = <Movie>[];
      json['Search'].forEach((v) {
        search!.add(new Movie.fromJson(v));
      });
    }
    totalResults = json['totalResults'];
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.search != null) {
      data['Search'] = this.search!.map((v) => v.toJson()).toList();
    }
    data['totalResults'] = this.totalResults;
    data['Response'] = this.response;
    return data;
  }
}

class Movie {
  String? title;
  String? year;
  String? imdbID;
  String? type;
  String? poster;
  bool? isLiked;

  Movie({this.title, this.year, this.imdbID, this.type, this.poster,this.isLiked});

  Movie.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    year = json['Year'];
    imdbID = json['imdbID'];
    type = json['Type'];
    poster = json['Poster'];
    isLiked = json['isLiked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Year'] = this.year;
    data['imdbID'] = this.imdbID;
    data['Type'] = this.type;
    data['Poster'] = this.poster;
    data['isLiked'] = this.isLiked;
    return data;
  }
}