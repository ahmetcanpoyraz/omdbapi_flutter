
import 'package:flutter/material.dart';
import 'package:omdbapi_flutter/views/favorites/favorites_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../../core/base/base_viewmodel/base_viewmodel.dart';
import '../../core/init/db/movies_database.dart';
import '../../core/models/movie_model.dart';
import '../home/home_viewmodel.dart';

class DetailViewModel extends BaseViewModel {
  bool isInit = false;
  late Movie movie;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  Future<void> init() async {
    if (!isInit) {
      changeStatus();
      isInit = !isInit;
    }
  }
  changeDetailMovie(Movie clickedMovie){
    movie = clickedMovie;
    notifyListeners();
  }

  Future<void> addFavorite(String title,String year,String imdbID,String type,String poster) async{
    movie.isLiked = true;
    Provider.of<HomeViewModel>(context!, listen: false).addMovieToDB(title, year, imdbID, type, poster);
    notifyListeners();
  }

  Future<void> removeFavorite(String imdbID) async{
    movie.isLiked = false;
    Provider.of<HomeViewModel>(context!, listen: false).deleteFavoriteMovie(imdbID);
    notifyListeners();
  }

  @override
  void dispose() {
    MoviesDatabase.instance.close();
    super.dispose();
  }

}
