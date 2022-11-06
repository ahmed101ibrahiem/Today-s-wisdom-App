
import 'package:flutter/material.dart';
import 'package:quotes_english/config/locale/app_localizations.dart';
import 'package:quotes_english/core/utils/app_color.dart';
import 'package:quotes_english/core/utils/app_strings.dart';
import 'package:quotes_english/core/utils/media_quary_values.dart';

class ErrorWidgets extends StatelessWidget {

 final VoidCallback? onPressed;
   ErrorWidgets({Key? key,  this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.warning_amber_rounded,color: AppColors.primary,size: 150,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              child: Text(AppLocalizations.of(context)!.translate('something_went_wrong')!,style: TextStyle(
                color: Colors.black,fontSize: 24,
                fontWeight: FontWeight.w700
              ),),),
            Text(AppLocalizations.of(context)!.translate('try_again')!,style: TextStyle(
                color: AppColors.hint,fontSize: 20,
                fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 20.0,),
            MaterialButton(
              elevation: 500,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)
              ),
              color: AppColors.primary,
              padding: EdgeInsets.all(12.0),
              minWidth: context.weight*0.45,
              onPressed: (){
                if(onPressed !=null){
                  onPressed!();
                }
              },child: Text(AppLocalizations.of(context)!.translate('reload_screen')!,style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 25
            ),),)
          ],
        ),
      ),
    );
  }
}
