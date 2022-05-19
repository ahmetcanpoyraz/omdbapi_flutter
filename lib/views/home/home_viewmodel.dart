
import 'package:flutter/material.dart';
import 'package:omdbapi_flutter/core/init/db/movies_database.dart';
import 'package:omdbapi_flutter/core/models/movie_db_model.dart';
import 'package:omdbapi_flutter/core/models/movie_model.dart';
import 'package:omdbapi_flutter/core/states/movie_state.dart';
import 'package:omdbapi_flutter/views/bottomnavigator/bottom_navigator_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../../core/base/base_viewmodel/base_viewmodel.dart';
import '../../core/components/global_widgets/alertdialog/custom_alertdialog.dart';
import '../../core/constants/navigation_constant.dart';
import '../../core/init/navigation/navigation_service.dart';
import '../detail/detail_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  bool isInit = false;
  late MovieState movieState;
  late TextEditingController searchController;
  MovieModel? movieList;
  late List<Moviedb> likedMovies;
  bool loading = false;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  Future<void> init() async {
    searchController = TextEditingController();
    movieState = MovieState();
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

  Future<void> getMovieForSearch(String searchString)async {
    loading = true;
    notifyListeners();
  await  movieState.getMovieForSearch(searchString).then((value) {
      movieList = value;
    });

    if(movieList!.search != null){
      for(var i = 0; i < movieList!.search!.length; i++){
        for(var j = 0; j < likedMovies.length; j++){
            if(movieList!.search![i].imdbID == likedMovies[j].imdbID){
              movieList!.search![i].isLiked = true;
            }
        }
      }
    }else{
      showAlert();
    }
    loading = false;
    notifyListeners();
  }

  Future<void> showAlert() async {
    await showDialog(
        barrierDismissible: false,
        context: context!,
        builder: (context) => CustomAlertDialog(
            isBackButton: false,
            message: "Please enter regular movie name",
            onLeftPressed: () {
              navigation.popPage();
            },
            leftBtnText:"Ok"));
  }

  Future<void> getFavoriteMovies()async {
    likedMovies = await MoviesDatabase.instance.readAllMovies();
    notifyListeners();
  }

  Future<void> addMovieToDB(String title,String year,String imdbID,String type,String poster) async {

    movieList!.search![movieList!.search!.indexWhere((element) => element.imdbID == imdbID)].isLiked=true;
    final movie = Moviedb(
      title: title,
      year: year,
      imdbID: imdbID,
      type: type,
      createdTime: DateTime.now(),
      poster: poster,
    );

    await MoviesDatabase.instance.create(movie);
    notifyListeners();

  }

  Future<void> deleteFavoriteMovie(String imdbID)async {
    await MoviesDatabase.instance.delete(imdbID);
    if(likedMovies != null){
      likedMovies.removeWhere((element) => element.imdbID == imdbID);
    }
    if(movieList != null){
      movieList!.search![movieList!.search!.indexWhere((element) => element.imdbID == imdbID)].isLiked=false;
    }
    notifyListeners();
  }

  Future<void> navigateToDetailPage(BuildContext context, Movie? chosenMovie) async {
   Provider.of<DetailViewModel>(context, listen: false).changeDetailMovie(chosenMovie!);
   navigation.navigateToPage(path: NavigationConstants.bottomNavigationBar);
   Provider.of<CustomBottomNavigationViewModel>(context, listen: false)
       .pageNameString = NavigationConstants.detailPage;
  }
}
