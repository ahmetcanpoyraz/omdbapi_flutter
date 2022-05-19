import '../../../views/home/home_view.dart';
import 'package:auto_route/auto_route.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // AutoRoute(page: HomePage, initial: true, path: "/home"),
    // AutoRoute(page: ProductPage),
    // AutoRoute(page: ProfilePage, path: "/profile"),
    // AutoRoute(
    //   page: LoginPage,
    // ),
  ],
)
class $AppRouter {}
