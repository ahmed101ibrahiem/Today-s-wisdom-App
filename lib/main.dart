import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_english/core/service/service_lecator.dart' as di;
import 'app.dart';
import 'features/randome_quotes/presentation/cubit/bloc_observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

