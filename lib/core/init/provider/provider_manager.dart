
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../../views/bottomnavigator/bottom_navigator_viewmodel.dart';
import '../../../views/detail/detail_viewmodel.dart';
import '../../../views/favorites/favorites_viewmodel.dart';
import '../../../views/home/home_viewmodel.dart';
import '../../../views/splash/splash_viewmodel.dart';
import '../../states/movie_state.dart';

class ProviderManager {
  static ProviderManager? _instance;
  static ProviderManager get instance {
    _instance ??= ProviderManager._init();
    return _instance!;
  }

  ProviderManager._init();

  List<SingleChildWidget> singleProvider = [
    ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel(),
    ),
    ChangeNotifierProvider<SplashViewModel>(
      create: (_) => SplashViewModel(),
    ),
    ChangeNotifierProvider<DetailViewModel>(
      create: (_) => DetailViewModel(),
    ),
    ChangeNotifierProvider<FavoritesViewModel>(
      create: (_) => FavoritesViewModel(),
    ),
    ChangeNotifierProvider<MovieState>(
      create: (_) => MovieState(),
    ),

    ChangeNotifierProvider<CustomBottomNavigationViewModel>(
      create: (_) => CustomBottomNavigationViewModel(),
    ),

  ];
}
