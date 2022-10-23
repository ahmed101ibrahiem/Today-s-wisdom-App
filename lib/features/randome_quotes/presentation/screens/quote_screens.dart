import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quotes_english/features/randome_quotes/presentation/cubit/logic_screens_cubit.dart';

import '../../../../core/shared_widget/error_widget.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/quote_content.dart';

class QuoteScreen extends StatefulWidget {
  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
//  _getRandomeQuore()=>BlocProvider.of<QuoteCubit>(context).getRandomeQuote();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<QuoteCubit>(context).getRandomeQuote();
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: const Text(AppStrings.AppName),
    );
    return RefreshIndicator(
        color: Colors.green,
        onRefresh: () => BlocProvider.of<QuoteCubit>(context).getRandomeQuote(),

        child: Scaffold(
        appBar: appBar,
        body: BlocBuilder<QuoteCubit, RandomQuoteInitial>(
    builder: ((context, state)
    {
      if (state is QuoteLoadedState) {
        return Column(
          children: [
            QuoteContent(
              quote: state.quote,
            ),
            InkWell(
              onTap: () =>
                  BlocProvider.of<QuoteCubit>(context).getRandomeQuote(),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 15.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
                child: Icon(
                  Icons.refresh,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            )
          ],
        );
      } else if (state is QuoteLoadingState) {
        return Center(
          child: SpinKitCircle(
            color: AppColors.primary,
          ),
        );
      } else if (state is QuoteErrorState) {
        return ErrorWidgets();
      } else {
        return Center(
          child: SpinKitCircle(
            color: Colors.red,
          ),
        );
        ;
      }
    }))
    ,
    )
    ,
    );
  }
}
