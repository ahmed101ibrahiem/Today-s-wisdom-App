import 'package:flutter/material.dart';

import 'core/themes/app_theme.dart';
import 'core/themes/route.dart';
import 'core/utils/app_strings.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.AppName,
      theme: AppTheme(),
      onGenerateRoute: AppRoute.onGenrateRoute,
    );
  }
}