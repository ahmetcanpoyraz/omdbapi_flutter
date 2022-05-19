import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:omdbapi_flutter/core/constants/application_constants.dart';
import 'package:omdbapi_flutter/core/models/movie_model.dart';
import '../base/base_viewmodel/base_viewmodel.dart';


class MovieState extends BaseViewModel {


  late MovieModel movieListResponse;

  Future<MovieModel> getMovieForSearch(String searchString) async {

    var response = await Dio().get("${ApplicationConstants.API_URL}$searchString&apikey=${ApplicationConstants.API_KEY}");

    if(response.statusCode == 200) {
      movieListResponse = MovieModel.fromJson(response.data);
    }
    notifyListeners();
    return movieListResponse;
  }











  @override
  FutureOr<void> init() {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }
}