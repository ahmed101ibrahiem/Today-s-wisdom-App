


import 'dart:convert';

import 'package:quotes_english/core/api/end_points.dart';
import 'package:quotes_english/core/error/exception.dart';
import 'package:quotes_english/core/utils/app_strings.dart';

import '../models/quote_models.dart';
import 'package:http/http.dart' as http;

abstract class BaseQuoteRemoteDataSource{
  Future<QuoteModel> gitRemoteDatasource();
}


class QuoteRemoteDatasourceImpl implements BaseQuoteRemoteDataSource{
  http.Client client;

  QuoteRemoteDatasourceImpl({required this.client});

  @override
  Future<QuoteModel> gitRemoteDatasource() async{
    final quoteUrl = Uri.parse(EndPoints.randomQuoteUrl);
    final response =await client.get(quoteUrl,headers: {
      AppStrings.contentType:AppStrings.applicationJson
    });

    if(response.statusCode ==200){
      return QuoteModel.fromJson(json.decode(response.body));
    }
    else{
      throw ServerException();
    }
  }
}