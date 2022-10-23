import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:quotes_english/core/error/failure.dart';
import 'package:quotes_english/core/usecase/usecase.dart';
import 'package:quotes_english/core/utils/app_strings.dart';
import 'package:quotes_english/features/randome_quotes/domain/entities/quote.dart';
import 'package:quotes_english/features/randome_quotes/domain/usecases/ouote_usecase.dart';

part 'logic_screens_state.dart';

class QuoteCubit extends Cubit<RandomQuoteInitial> {
  QuoteCubit({required this.quoteUseCase}) : super(InitialQuoteState());
  QuoteCubit get(context)=>BlocProvider.of(context);
  final QuoteUseCase quoteUseCase;
  Future<void> getRandomeQuote()async{
    emit(QuoteLoadingState());
    Either<Failure,Quite> response = await quoteUseCase(NoParams());
    emit(response.fold((l) => QuoteErrorState(msg: _mapFailureToMsg(l)), (r) => QuoteLoadedState(quote: r)));
  }

  String _mapFailureToMsg (Failure failure){
    switch(failure.runtimeType){
      case ServiceFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;
      default:
        return AppStrings.unexpectedError;
    }
  }

}
