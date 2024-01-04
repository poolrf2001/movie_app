import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie_detail_model.dart';

import '../models/movie_models.dart';
import '../ui/utils/constants.dart';
class APIServices{
  Future<List<MovieModel>> getMovies() async {
    Uri uri = Uri.parse(
        "$pathProduction/discover/movie?api_key=$apiKey&language=es-Es");
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      // print(response.body);
      Map<String, dynamic> myMap = json.decode(response.body);
      List movies = myMap["results"];
      List<MovieModel> movieList=movies.map((e) => MovieModel.fromJson(e)).toList();
      return movieList;
    }
    return [];
  }

  Future<MovieDetailModel?> getMovieDetail(int movieId) async{
    Uri uri = Uri.parse(
        "$pathProduction/movie/$movieId?api_key=$apiKey&language=es-Es");
    http.Response response = await http.get(uri);
    //print(response.statusCode);
    if (response.statusCode == 200) {
      // print(response.body);
      Map<String, dynamic> myMap = json.decode(response.body);
      //print(myMap);
      // List movies = myMap["results"];
      // List<MovieModel> movieList=movies.map((e) => MovieModel.fromJson(e)).toList();
      // return movieList;
      MovieDetailModel movieDetailModel =MovieDetailModel.fromJson(myMap);
      return movieDetailModel;
    }
    return null;
  }



}







