import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favourate_cube_state.dart';

class FavourateCubeCubit extends Cubit<FavourateCubeState> {
  FavourateCubeCubit() : super(FavourateCubeInitial());
}
