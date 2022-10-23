
import 'package:equatable/equatable.dart';

class Quite extends Equatable{

  final String author;
  final int id;

  final String quote;

  Quite({required this.author,required this.quote,required this.id});

  @override
  // TODO: implement props
  List<Object?> get props =>[author, id, quote];
}