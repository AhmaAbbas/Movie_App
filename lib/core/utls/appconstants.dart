import 'package:flutter/material.dart';

class AppConstants{
  static  const String  baseurl="https://api.themoviedb.org/3";
  static const String apikey="39531f805148cc7859e393cba8f244ae";
  static  const String  urlgetnowplayingmovies= "$baseurl/movie/now_playing?api_key=$apikey";
  static  const String  urlgetpopularmovies= "$baseurl/movie/popular?api_key=$apikey";
  static  const String  urlgettopratedmovies="$baseurl/movie/top_rated?api_key=$apikey";
  static  const String  urlmoviedetails= "$baseurl/movie/550?api_key=$apikey";
  static const String baseimageurl ="https://image.tmdb.org/t/p/w500";
  static const String dumyimgurl="https://image.tmdb.org/t/p/w500/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg";

  static String imgeurl(String path){
    return "$baseimageurl$path";
  }

//https://api.themoviedb.org/3/movie/713704?api_key=39531f805148cc7859e393cba8f244ae
  static String urlmovidetails(int id){
    return "$baseurl/movie/$id?api_key=$apikey";
  }

  static String urlrecommendations(int id){
    return "$baseurl/movie/$id/recommendations?api_key=$apikey";
  }

  static TextStyle textwhie=TextStyle(
      fontSize: 16.0,
      color: Colors.white
  );
}
//https://api.themoviedb.org/3/movie/popular?api_key=39531f805148cc7859e393cba8f244ae