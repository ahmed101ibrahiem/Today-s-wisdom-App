
import '../../domain/entities/quote.dart';

class QuoteModel extends Quite {
  QuoteModel({required String author,
    required String quote, required int id})
      : super(author: author, quote: quote, id: id);

  factory QuoteModel.fromJson(Map<String, dynamic> json)=>
      QuoteModel(author: json['author'],
          quote: json['quote'], id: json['id']);

  Map <String,dynamic>toJson ()=>{
    'id':id,
    'author':author,
    'quote':quote,
  };
}