// ignore_for_file: public_member_api_docs, sort_constructors_first
class Movies {
  Movies({
    required this.posterPath,
    required this.id,
    required this.backdropPath,
    required this.totalResults,
    required this.public,
    required this.revenue,
    required this.page,
    required this.listMovies,
    required this.iso_639_1,
    required this.totalPages,
    required this.description,
    required this.iso_3166_1,
    required this.averageRating,
    required this.runtime,
    required this.name,
  });
  late final String posterPath;
  late final int id;
  late final String backdropPath;
  late final int totalResults;
  late final bool public;
  late final String revenue;
  late final int page;
  late final List<Movie> listMovies;
  late final String iso_639_1;
  late final int totalPages;
  late final String description;
  late final String iso_3166_1;
  late final double averageRating;
  late final int runtime;
  late final String name;

  Movies.fromJson(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    id = json['id'];
    backdropPath = json['backdrop_path'];
    totalResults = json['total_results'];
    public = json['public'];
    revenue = json['revenue'];
    page = json['page'];
    listMovies =
        List.from(json['results']).map((e) => Movie.fromJson(e)).toList();
    iso_639_1 = json['iso_639_1'];
    totalPages = json['total_pages'];
    description = json['description'];
    iso_3166_1 = json['iso_3166_1'];
    averageRating = json['average_rating'];
    runtime = json['runtime'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['poster_path'] = posterPath;
    _data['id'] = id;
    _data['backdrop_path'] = backdropPath;
    _data['total_results'] = totalResults;
    _data['public'] = public;
    _data['revenue'] = revenue;
    _data['page'] = page;
    _data['results'] = listMovies.map((e) => e.toJson()).toList();
    _data['iso_639_1'] = iso_639_1;
    _data['total_pages'] = totalPages;
    _data['description'] = description;
    _data['iso_3166_1'] = iso_3166_1;
    _data['average_rating'] = averageRating;
    _data['runtime'] = runtime;
    _data['name'] = name;
    return _data;
  }

  @override
  String toString() {
    return 'Movies(posterPath: $posterPath, id: $id, backdropPath: $backdropPath, totalResults: $totalResults, public: $public, revenue: $revenue, page: $page, listMovies: $listMovies, iso_639_1: $iso_639_1, totalPages: $totalPages, description: $description, iso_3166_1: $iso_3166_1, averageRating: $averageRating, runtime: $runtime, name: $name)';
  }

  @override
  bool operator ==(covariant Movies other) {
    if (identical(this, other)) return true;

    return other.posterPath == posterPath &&
        other.id == id &&
        other.backdropPath == backdropPath &&
        other.totalResults == totalResults &&
        other.public == public &&
        other.revenue == revenue &&
        other.page == page &&
        other.listMovies == listMovies &&
        other.iso_639_1 == iso_639_1 &&
        other.totalPages == totalPages &&
        other.description == description &&
        other.iso_3166_1 == iso_3166_1 &&
        other.averageRating == averageRating &&
        other.runtime == runtime &&
        other.name == name;
  }

  @override
  int get hashCode {
    return posterPath.hashCode ^
        id.hashCode ^
        backdropPath.hashCode ^
        totalResults.hashCode ^
        public.hashCode ^
        revenue.hashCode ^
        page.hashCode ^
        listMovies.hashCode ^
        iso_639_1.hashCode ^
        totalPages.hashCode ^
        description.hashCode ^
        iso_3166_1.hashCode ^
        averageRating.hashCode ^
        runtime.hashCode ^
        name.hashCode;
  }

  Movies copyWith({
    String? posterPath,
    int? id,
    String? backdropPath,
    int? totalResults,
    bool? public,
    String? revenue,
    int? page,
    List<Movie>? listMovies,
    String? iso_639_1,
    int? totalPages,
    String? description,
    String? iso_3166_1,
    double? averageRating,
    int? runtime,
    String? name,
  }) {
    return Movies(
      posterPath: posterPath ?? this.posterPath,
      id: id ?? this.id,
      backdropPath: backdropPath ?? this.backdropPath,
      totalResults: totalResults ?? this.totalResults,
      public: public ?? this.public,
      revenue: revenue ?? this.revenue,
      page: page ?? this.page,
      listMovies: listMovies ?? this.listMovies,
      iso_639_1: iso_639_1 ?? this.iso_639_1,
      totalPages: totalPages ?? this.totalPages,
      description: description ?? this.description,
      iso_3166_1: iso_3166_1 ?? this.iso_3166_1,
      averageRating: averageRating ?? this.averageRating,
      runtime: runtime ?? this.runtime,
      name: name ?? this.name,
    );
  }
}

class Movie {
  Movie({
    required this.posterPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
    required this.originalTitle,
    required this.genreIds,
    required this.id,
    required this.mediaType,
    required this.originalLanguage,
    required this.title,
    required this.backdropPath,
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.voteAverage,
  });
  late final String posterPath;
  late final bool adult;
  late final String overview;
  late final String releaseDate;
  late final String originalTitle;
  late final List<int> genreIds;
  late final int id;
  late final String mediaType;
  late final String originalLanguage;
  late final String title;
  late final String backdropPath;
  late final double popularity;
  late final int voteCount;
  late final bool video;
  late final double voteAverage;

  Movie.fromJson(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    originalTitle = json['original_title'];
    genreIds = List.castFrom<dynamic, int>(json['genre_ids']);
    id = json['id'];
    mediaType = json['media_type'];
    originalLanguage = json['original_language'];
    title = json['title'];
    backdropPath = json['backdrop_path'];
    popularity = json['popularity'];
    voteCount = json['vote_count'];
    video = json['video'];
    voteAverage = json['vote_average'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['poster_path'] = posterPath;
    _data['adult'] = adult;
    _data['overview'] = overview;
    _data['release_date'] = releaseDate;
    _data['original_title'] = originalTitle;
    _data['genre_ids'] = genreIds;
    _data['id'] = id;
    _data['media_type'] = mediaType;
    _data['original_language'] = originalLanguage;
    _data['title'] = title;
    _data['backdrop_path'] = backdropPath;
    _data['popularity'] = popularity;
    _data['vote_count'] = voteCount;
    _data['video'] = video;
    _data['vote_average'] = voteAverage;
    return _data;
  }

  @override
  String toString() {
    return 'Movie(posterPath: $posterPath, adult: $adult, overview: $overview, releaseDate: $releaseDate, originalTitle: $originalTitle, genreIds: $genreIds, id: $id, mediaType: $mediaType, originalLanguage: $originalLanguage, title: $title, backdropPath: $backdropPath, popularity: $popularity, voteCount: $voteCount, video: $video, voteAverage: $voteAverage)';
  }

  @override
  bool operator ==(covariant Movie other) {
    if (identical(this, other)) return true;

    return other.posterPath == posterPath &&
        other.adult == adult &&
        other.overview == overview &&
        other.releaseDate == releaseDate &&
        other.originalTitle == originalTitle &&
        other.genreIds == genreIds &&
        other.id == id &&
        other.mediaType == mediaType &&
        other.originalLanguage == originalLanguage &&
        other.title == title &&
        other.backdropPath == backdropPath &&
        other.popularity == popularity &&
        other.voteCount == voteCount &&
        other.video == video &&
        other.voteAverage == voteAverage;
  }

  @override
  int get hashCode {
    return posterPath.hashCode ^
        adult.hashCode ^
        overview.hashCode ^
        releaseDate.hashCode ^
        originalTitle.hashCode ^
        genreIds.hashCode ^
        id.hashCode ^
        mediaType.hashCode ^
        originalLanguage.hashCode ^
        title.hashCode ^
        backdropPath.hashCode ^
        popularity.hashCode ^
        voteCount.hashCode ^
        video.hashCode ^
        voteAverage.hashCode;
  }

  Movie copyWith({
    String? posterPath,
    bool? adult,
    String? overview,
    String? releaseDate,
    String? originalTitle,
    List<int>? genreIds,
    int? id,
    String? mediaType,
    String? originalLanguage,
    String? title,
    String? backdropPath,
    double? popularity,
    int? voteCount,
    bool? video,
    double? voteAverage,
  }) {
    return Movie(
      posterPath: posterPath ?? this.posterPath,
      adult: adult ?? this.adult,
      overview: overview ?? this.overview,
      releaseDate: releaseDate ?? this.releaseDate,
      originalTitle: originalTitle ?? this.originalTitle,
      genreIds: genreIds ?? this.genreIds,
      id: id ?? this.id,
      mediaType: mediaType ?? this.mediaType,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      title: title ?? this.title,
      backdropPath: backdropPath ?? this.backdropPath,
      popularity: popularity ?? this.popularity,
      voteCount: voteCount ?? this.voteCount,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
    );
  }
}
