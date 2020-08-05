class Peliculas{
  List<Pelicula> items = new List();

  Peliculas();
  Peliculas.fromJsonList( List<dynamic> jsonList ) {
    if(jsonList == null) return;
    for (var item in jsonList) {
      final pelicula = new Pelicula.fromJsonMap(item);
      items.add(pelicula);
    }
  }
}

class Pelicula {
  String uniqueId;
  bool adult;
  String backdropPath;
  dynamic belongsToCollection;
  int budget;
  List<Genre> genres;
  String homepage;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  List<ProductionCompany> productionCompanies;
  List<ProductionCountry> productionCountries;
  String releaseDate;
  int revenue;
  int runtime;
  List<SpokenLanguage> spokenLanguages;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  Pelicula({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  Pelicula.fromJsonMap(Map<String, dynamic> json){
    adult               = json['adult'];
    backdropPath        = json['backdrop_path'];
    belongsToCollection = json['belongs_to_Collection'];
    budget              = json['budget'];
    genres              = json['genres'];
    homepage            = json['homepage'];
    id                  = json['id'];
    imdbId              = json['imdb_id'];
    originalLanguage    = json['original_language'];
    originalTitle       = json['original_title'];
    overview            = json['overview'];
    popularity          = json['popularity']/1;
    posterPath          = json['poster_path'];
    productionCompanies = json['production_companies'];
    productionCountries = json['production_countries'];
    releaseDate         = json['release_date'];
    revenue             = json['revenue'];
    runtime             = json['runtime'];
    spokenLanguages     = json['spoken_languages'];
    status              = json['status'];
    tagline             = json['tagline'];
    title               = json['title'];
    video               = json['video'];
    voteAverage         = json['vote_average']/1;
    voteCount           = json['vote_count'];
  }
  getPosterImg() {
    if(posterPath == null){
      return 'https://matthewsenvironmentalsolutions.com/images/com_hikashop/upload/not-available.png'; 
    }else{
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }

  getBackgroundImg() {
    if(posterPath == null){
      return 'https://matthewsenvironmentalsolutions.com/images/com_hikashop/upload/not-available.png'; 
    }else{
      return 'https://image.tmdb.org/t/p/w500/$backdropPath';
    }
  }

}


class Genre {
  int id;
  String name;

  Genre({
    this.id,
    this.name,
  });
}

class ProductionCompany {
  int id;
  String logoPath;
  String name;
  String originCountry;

  ProductionCompany({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });
}

class ProductionCountry {
  String iso31661;
  String name;

  ProductionCountry({
    this.iso31661,
    this.name,
  });
}

class SpokenLanguage {
  String iso6391;
  String name;

  SpokenLanguage({
    this.iso6391,
    this.name,
  });

}
