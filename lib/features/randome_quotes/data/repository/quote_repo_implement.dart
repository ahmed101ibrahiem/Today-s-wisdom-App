

import 'package:dartz/dartz.dart';
import 'package:quotes_english/core/error/exception.dart';
import 'package:quotes_english/core/error/failure.dart';
import 'package:quotes_english/features/randome_quotes/data/datasource/local_datasource.dart';
import 'package:quotes_english/features/randome_quotes/data/datasource/remote_datasource.dart';
import 'package:quotes_english/features/randome_quotes/domain/entities/quote.dart';
import 'package:quotes_english/features/randome_quotes/domain/repository/quote_repo.dart';

import '../../../../core/network/network_info.dart';

class QuoteRepositoryImplement extends QuoteRepository{
  final NetworkInfo networkInfo;
 final BaseQuoteRemoteDataSource baseQuoteRemoteDataSource;
 final BaseQuoteLocalDataSource baseQuoteLocalDataSource;

  QuoteRepositoryImplement(
      {required this.networkInfo,
        required    this.baseQuoteRemoteDataSource,
        required    this.baseQuoteLocalDataSource});

  @override
  Future<Either<Failure, Quite>> getAllQuotes() async{

    if(await networkInfo.isConnected){
      try{
      final result = await baseQuoteRemoteDataSource.gitRemoteDatasource();
      baseQuoteLocalDataSource.cacheQuote(result);
      return Right(result);
      } on ServerException{
        return Left(ServiceFailure());
      }
    }else{
      try {
        final result = await baseQuoteLocalDataSource.getCachedLastQuote();
        return Right(result);
      } on CacheException{
        return Left(CacheFailure());
      }
    }

  }

}