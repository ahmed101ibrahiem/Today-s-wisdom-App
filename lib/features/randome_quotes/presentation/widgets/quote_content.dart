import 'package:flutter/material.dart';
import 'package:quotes_english/features/randome_quotes/domain/entities/quote.dart';
import '../../../../core/utils/app_color.dart';

class QuoteContent extends StatelessWidget {
  Quite quote;

  QuoteContent({required this.quote});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(30.0)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              '${quote.quote}',
              style: TextStyle(
                  height: 1.3,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,fontSize: 20
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              '${quote.author}',style:  TextStyle(
                height: 1.3,
                color: Colors.white,
                fontWeight: FontWeight.bold,fontSize: 22
            ),
                textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
