

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:quotes_english/core/error/failure.dart';

abstract class UseCase<Type,Params>{
  Future<Either<Failure,Type>> call(Params params);
}

class NoParams extends Equatable{
  @override
  List<Object?> get props =>[];
}

/// if there params as example
//   class LoginParams extends Equatable{
//   final String email;
//   final String password;
//   LoginParams({required this.email, required this.password});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
// }