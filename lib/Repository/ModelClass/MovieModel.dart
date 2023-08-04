class MovieModel {
  MovieModel({
      this.page, 
      this.results,});

  MovieModel.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }
  dynamic page;
  List<Results>? results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Results {
  Results({
      this.imageurl, 
      this.genre, 
      this.imdbid, 
      this.title, 
      this.imdbrating, 
      this.released, 
      this.synopsis, 
      this.type,});

  Results.fromJson(dynamic json) {
    imageurl = json['imageurl'] != null ? json['imageurl'].cast<String>() : [];
    genre = json['genre'] != null ? json['genre'].cast<String>() : [];
    imdbid = json['imdbid'];
    title = json['title'];
    imdbrating = json['imdbrating'];
    released = json['released'];
    synopsis = json['synopsis'];
    type = json['type'];
  }
  List<String>? imageurl;
  List<String>? genre;
  String? imdbid;
  String? title;
  dynamic imdbrating;
  dynamic released;
  String? synopsis;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['imageurl'] = imageurl;
    map['genre'] = genre;
    map['imdbid'] = imdbid;
    map['title'] = title;
    map['imdbrating'] = imdbrating;
    map['released'] = released;
    map['synopsis'] = synopsis;
    map['type'] = type;
    return map;
  }

}