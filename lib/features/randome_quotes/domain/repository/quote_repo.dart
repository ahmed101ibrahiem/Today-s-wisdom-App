


import 'package:dartz/dartz.dart';
import 'package:quotes_english/core/error/failure.dart';

import '../entities/quote.dart';

abstract class QuoteRepository{
  Future<Either<Failure,Quite>>getAllQuotes();
}