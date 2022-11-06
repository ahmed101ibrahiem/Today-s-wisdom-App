import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_english/config/locale/app_localizations_setup.dart';
import 'package:quotes_english/features/randome_quotes/presentation/cubit/logic_screens_cubit.dart';
import 'core/service/service_lecator.dart';
import 'core/themes/app_theme.dart';
import 'core/themes/route.dart';
import 'core/utils/app_strings.dart';
import 'features/splash_screen/presentation/controller/local_cubit.dart';
import 'package:quotes_english/core/service/service_lecator.dart' as di;


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>di.sl<LocalCubit>()..getSavedLang()),
        BlocProvider(create: (context) =>di.sl<QuoteCubit>()),

      ],
      child: BlocBuilder<LocalCubit,LocalState>(
        buildWhen:(previous, current){
          return previous != current;
        } ,
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.AppName,
            locale: state.locale,
            theme: AppTheme(),
            onGenerateRoute: AppRoute.onGenrateRoute,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
          );
        },

      ),
    );
  }
}