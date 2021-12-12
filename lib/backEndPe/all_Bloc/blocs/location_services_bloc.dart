import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taif/backEndPe/repository/location_services.dart';
import 'package:taif/models/data_singel_locaton_service.dart';

part '../events/location_services_event.dart';
part '../states/location_services_state.dart';

class LocationServicesBloc extends Bloc<LocationServicesEvent, LocationServicesState> {
 final LocationServicesRepostory locationServicesRepostory;
  LocationServicesBloc(this.locationServicesRepostory) : super(LocationServicesInitial());

  @override
  Stream<LocationServicesState> mapEventToState(
    LocationServicesEvent event,
  ) async* {
    if(event is getSingleLocationServicesEvent){
      yield  LocationServicesLoding();

      try{
        final fetchData= await locationServicesRepostory.getAllLocationServices(event.id);
        yield LocationServicesStateLoaded(fetchData);
      }catch(e){
        yield LocationServicesStateError(e.toString());
      }
    }
  }
}
