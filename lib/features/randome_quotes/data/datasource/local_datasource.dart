
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:quotes_english/core/error/exception.dart';
import 'package:quotes_english/core/utils/app_strings.dart';
import 'package:quotes_english/features/randome_quotes/data/models/quote_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/quote.dart';

abstract class BaseQuoteLocalDataSource{
  Future<QuoteModel>  getCachedLastQuote();
  Future<void> cacheQuote(QuoteModel model);
}
class QuoteLocalDataSourceImpl implements BaseQuoteLocalDataSource{
  final SharedPreferences sharedPreferences;

  QuoteLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<QuoteModel> getCachedLastQuote() async {
    final jsonString = sharedPreferences.getString(AppStrings.cacheRandomQuote);
    if(jsonString != null){
      final cacheRandom =Future.value( QuoteModel.fromJson(json.decode(jsonString)));
      return cacheRandom;
    }else{
      throw CacheException();
    }
  }

  @override
  Future<void> cacheQuote(QuoteModel model) {
    final cacheSharedpref = sharedPreferences.setString(AppStrings.cacheRandomQuote,
        json.encode(model));
    return cacheSharedpref;
  }
}