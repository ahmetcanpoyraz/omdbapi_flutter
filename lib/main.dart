import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/init/locale_manager/locale_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/provider/provider_manager.dart';
import 'core/init/provider/theme_provider.dart';

Future<void> main() async {
  Provider.debugCheckInvalidValueType = null;

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await LocaleManager.prefrencesInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...ProviderManager.instance.singleProvider],
      child: ScreenUtilInit(
        builder: (context, child) => ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
            builder: (context, _) {
              final themeProvider = Provider.of<ThemeProvider>(context);
              return MaterialApp(
                themeMode: themeProvider.themeMode,
                theme: MyThemes.lightTheme,
                darkTheme: MyThemes.darkTheme,
                debugShowCheckedModeBanner: false,
                onGenerateRoute: NavigationRoute.instance.generateRoute,
                navigatorKey: NavigationService.instance.navigatorKey,
              );
            }),
      ),
    );
  }
}
