import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/screens/primary_screens/main_screen/cubit/state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(MainInitState());

  static MainScreenCubit get(context) => BlocProvider.of(context);


}
