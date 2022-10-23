


import 'package:dartz/dartz.dart';
import 'package:quotes_english/core/usecase/usecase.dart';

import '../../../../core/error/failure.dart';
import '../entities/quote.dart';
import '../repository/quote_repo.dart';

class QuoteUseCase implements UseCase<Quite,NoParams>{
  QuoteRepository quoteRepository;
  QuoteUseCase({required this.quoteRepository});

  @override
  Future<Either<Failure, Quite>> call(NoParams params) {

    return quoteRepository.getAllQuotes();
  }

  }
