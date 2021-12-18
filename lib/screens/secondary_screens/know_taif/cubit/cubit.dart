import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/dio/dio_helper.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/documentations_model.dart';
import 'package:taif/models/taif_model.dart';
import 'package:taif/screens/secondary_screens/contracts_section_screens/cubit/state.dart';
import 'package:taif/screens/secondary_screens/documentation_screen/cubit/state.dart';
import 'package:taif/screens/secondary_screens/know_taif/cubit/state.dart';

class TaifCubit extends Cubit<TaifState> {
  TaifCubit() : super(TaifInitState());

  static TaifCubit get(context) => BlocProvider.of(context);

  TaifModel taifModel = TaifModel();

  Future<void> getTaif() async {
    emit(GetTaifLoadingState());
    late LocationData currentLocation;
    var location = new Location();
    try {
      currentLocation = await location.getLocation();
    } on Exception {

    }
    DioHelper.init();
    DioHelper.getData(url: 'posts?tag_id=1').then((value) {
      if (value.statusCode == 200) {
        print('taif');
        print(value.data);
        print('taif');
        taifModel = TaifModel.fromJson(value.data);
        // for(var lo in taifModel.data!)
        // {  lo.km=0;
        // if(lo.locationLng!=null)
        // {
        //   double _distanceInMeters = Geolocator.distanceBetween(
        //     double?.tryParse(lo.locationLat!)!,
        //     double?.tryParse(lo.locationLng!)!,
        //     currentLocation.latitude!,
        //     currentLocation.longitude!,
        //   );
        //   print("_distanceInMeters");
        //   print(_distanceInMeters/1000);
        //   lo.km=double.tryParse((_distanceInMeters/1000).toStringAsFixed(3));
        //   print( lo.km);
        //   print("_distanceInMeters");
        // }
        //
        // }

      }else{
        print("error load know taif");
        print(">>>>>>>>>>>>>>>>>>");
      }
      emit(GetTaifSuccessState());
    }).catchError((e) {
      print('taif error ');
      emit(GetTaifErrorState());
    });
  }

}
