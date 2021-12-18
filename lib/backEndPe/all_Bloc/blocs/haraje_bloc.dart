import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taif/backEndPe/all_Bloc/blocs/estates_bloc.dart';
import 'package:taif/backEndPe/repository/haraje.dart';
import 'package:taif/models/data_singel_heraje.dart';

part '../events/haraje_event.dart';
part '../states/haraje_state.dart';

class HarajeBloc extends Bloc<HarajeEvent, HarajeState> {

 final HarajeRepostory harajeRepostory;
  HarajeBloc(this.harajeRepostory) : super(HarajeInitial());

  @override
  Stream<HarajeState> mapEventToState(
    HarajeEvent event,
  ) async* {
    if(event is getSingleHarajeEvent){
      yield  HarajeStateLoading();

      try{
        final fetchData= await harajeRepostory.getAllHaraje(event.id);
        yield HarajeStateLoaded(fetchData);
      }catch(e){
        yield HarajeStateError(e.toString());
      }
    }
  }
}
