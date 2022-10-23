
import 'package:flutter/material.dart';

import '../../../../core/themes/route.dart';
import '../../../../core/utils/app_strings.dart';

class FavouritPage extends StatefulWidget {
  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<FavouritPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: ()=>Navigator.pushNamed(context, Routes.initailPage),
            child: Text(AppStrings.AppName)),
      ),
    );
  }
}
