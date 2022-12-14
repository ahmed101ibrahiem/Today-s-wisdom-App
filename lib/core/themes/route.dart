import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/favourte/presentation/screens/favourate_page.dart';
import '../../features/randome_quotes/presentation/cubit/logic_screens_cubit.dart';
import '../../features/randome_quotes/presentation/screens/quote_screens.dart';
import '../../features/splash_screen/presentation/screens/splash_screen.dart';
import '../service/service_lecator.dart' as di;
import '../utils/app_strings.dart';

class Routes {
  static const String initailPage = '/';
  static const String favourateScreen = '/favourateScreen';
  static const String randomQuote = '/randomQuote';
}

class AppRoute {
  static Route? onGenrateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initailPage:
      case Routes.favourateScreen:
        return MaterialPageRoute(builder: ((context) => SplashScreen()));
      case Routes.randomQuote:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (BuildContext context) => di.sl<QuoteCubit>(),
                child: QuoteScreen()));
      case Routes.favourateScreen:
        return MaterialPageRoute(builder: ((context) => FavouritPage()));
      default:
        return unDefinedltO();
    }
  }

  static Route<dynamic> unDefinedltO() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noScrern),
              ),
            )));
  }
}
