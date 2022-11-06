import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quotes_english/core/network/network_info.dart';
import 'package:quotes_english/features/randome_quotes/data/datasource/local_datasource.dart';
import 'package:quotes_english/features/randome_quotes/data/datasource/remote_datasource.dart';
import 'package:quotes_english/features/randome_quotes/data/repository/quote_repo_implement.dart';
import 'package:quotes_english/features/randome_quotes/domain/repository/quote_repo.dart';
import 'package:quotes_english/features/randome_quotes/domain/usecases/ouote_usecase.dart';
import 'package:quotes_english/features/splash_screen/data/repositort_implement/change_lang_repo_implement.dart';
import 'package:quotes_english/features/splash_screen/domain/usecase/get_saved_local.dart';
import 'package:quotes_english/features/splash_screen/presentation/controller/local_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/randome_quotes/presentation/cubit/logic_screens_cubit.dart';
import 'package:http/http.dart' as http;

import '../../features/splash_screen/data/data_source/lang_local_data_source.dart';
import '../../features/splash_screen/domain/repository/change_lang_repository.dart';
import '../../features/splash_screen/domain/usecase/change_local.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// features
  // blocs
  sl.registerFactory<QuoteCubit>(() => QuoteCubit(quoteUseCase: sl()));
  sl.registerFactory<LocalCubit>(() =>
      LocalCubit(changLangUseCase: sl(), getSavedChangeLangUseCase: sl()));

  // useCase
  sl.registerLazySingleton(() => QuoteUseCase(quoteRepository: sl()));
  sl.registerLazySingleton(() => GetSavedChangeLangUseCase(langRepository: sl()));
  sl.registerLazySingleton(() => ChangLangUseCase(sl()));


  // Repo
  sl.registerLazySingleton<QuoteRepository>(() => QuoteRepositoryImplement(
      baseQuoteLocalDataSource: sl(),
      baseQuoteRemoteDataSource: sl(),
      networkInfo: sl()));

  sl.registerLazySingleton<LangRepository>(() => LangRepositoryImplement(langDataSource: sl()));
  // data source
  sl.registerLazySingleton<BaseQuoteRemoteDataSource>(
      () => QuoteRemoteDatasourceImpl(client: sl()));
  sl.registerLazySingleton<BaseQuoteLocalDataSource>(
      () => QuoteLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<LangDataSource>(() =>LangDataSourceImplement(sharedPreferences: sl()) );

  /// core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));

  /// extra
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
