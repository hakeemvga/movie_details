import 'dart:convert';


import 'package:http/http.dart';
import 'package:movie_details/Repository/ModelClass/MovieModel.dart';


import 'api_client.dart';




class MovieApi {
  ApiClient apiClient = ApiClient();


  Future<MovieModel> fetchMovieDetails() async {
    String trendingpath = 'https://ott-details.p.rapidapi.com/advancedsearch?start_year=1970&end_year=2020&min_imdb=6&max_imdb=7.8&genre=action&language=english&type=movie&sort=latest&page=1';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return MovieModel.fromJson(jsonDecode(response.body));
  }
}