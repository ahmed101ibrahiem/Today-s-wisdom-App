part of 'logic_screens_cubit.dart';

@immutable
abstract class RandomQuoteInitial extends Equatable{
  @override

  List<Object?> get props => [];
}

class InitialQuoteState extends RandomQuoteInitial {}

class QuoteLoadingState extends RandomQuoteInitial {}
class QuoteLoadedState extends RandomQuoteInitial {
  final Quite quote;
  QuoteLoadedState({required this.quote});
  @override
  List<Object?> get props => [quote];

}
class QuoteErrorState extends RandomQuoteInitial {
  final String msg;
  QuoteErrorState({required this.msg});
  @override
  List<Object?> get props => [msg];


}
