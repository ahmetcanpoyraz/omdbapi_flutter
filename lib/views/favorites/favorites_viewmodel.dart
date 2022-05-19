
import 'package:flutter/material.dart';
import 'package:omdbapi_flutter/views/home/home_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../../core/base/base_viewmodel/base_viewmodel.dart';
import '../../core/init/db/movies_database.dart';
import '../../core/models/movie_db_model.dart';

class FavoritesViewModel extends BaseViewModel {
  bool isInit = false;
  late List<Moviedb> movies;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  Future<void> init() async {
    await getFavoriteMovies();
    if (!isInit) {
      changeStatus();
      isInit = !isInit;
    }
  }
  @override
  void dispose() {
    MoviesDatabase.instance.close();
    super.dispose();
  }

  Future<void> getFavoriteMovies()async {
    movies = await MoviesDatabase.instance.readAllMovies();
    notifyListeners();
  }

  Future<void> deleteFavoriteMovie(String imdbID)async {
     await MoviesDatabase.instance.delete(imdbID);
    movies.removeWhere((element) => element.imdbID == imdbID);
    Provider.of<HomeViewModel>(context!, listen: false).deleteFavoriteMovie(imdbID);
    notifyListeners();
  }

}
