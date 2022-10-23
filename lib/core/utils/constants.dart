import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_strings.dart';

class Constants {
  static void showErrorDiologe(
      {required BuildContext context, required String msg,}) {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(
                msg,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              actions: [
                TextButton(
                    style: TextButton.styleFrom(primary: Colors.amberAccent),
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Ok',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: AppStrings.fontFamily),
                    ))
              ],
            ));
  }


}
