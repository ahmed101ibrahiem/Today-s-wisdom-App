


import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quotes_english/core/network/network_info.dart';
import 'package:quotes_english/features/randome_quotes/data/datasource/local_datasource.dart';
import 'package:quotes_english/features/randome_quotes/data/datasource/remote_datasource.dart';
import 'package:quotes_english/features/randome_quotes/data/repository/quote_repo_implement.dart';
import 'package:quotes_english/features/randome_quotes/domain/repository/quote_repo.dart';
import 'package:quotes_english/features/randome_quotes/domain/usecases/ouote_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/randome_quotes/presentation/cubit/logic_screens_cubit.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;
Future<void> init ()async{
  /// features
  // blocs
  sl.registerFactory(() => QuoteCubit(quoteUseCase:sl()));
  // useCase
  sl.registerLazySingleton(() => QuoteUseCase(quoteRepository:sl()));
  // Repo
  sl.registerLazySingleton<QuoteRepository>(() => QuoteRepositoryImplement(
    baseQuoteLocalDataSource: sl(),
    baseQuoteRemoteDataSource: sl(),
    networkInfo: sl()
  ));
  // data source
  sl.registerLazySingleton<BaseQuoteRemoteDataSource>(() => QuoteRemoteDatasourceImpl(client:sl()));
 sl.registerLazySingleton<BaseQuoteLocalDataSource>(() => QuoteLocalDataSourceImpl(sharedPreferences: sl()));
  /// core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(internetConnectionChecker: sl()));
  /// extra
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}