import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:taif/backEndPe/repository/districts.dart';
import 'package:taif/models/data_districts.dart';

part '../events/districts_event.dart';
part '../states/districts_state.dart';

class DistrictsBloc extends Bloc<DistrictsEvent, DistrictsState> {


  final DistrictsRepostory districtsRepostory;

  DistrictsBloc(this.districtsRepostory) : super(DistrictsInitial());

  @override
  Stream<DistrictsState> mapEventToState(
      DistrictsEvent event,
      ) async* {

    if(event is getAllDistrictsEvent){
      yield  AllDistrictsLoading();

      try{
        final fetchData= await districtsRepostory.getAllDistricts();
        yield AllDistrictsStateLoaded(fetchData);
      }catch(e){
        debugPrint("___________________________----------------"+e.toString());
        yield AllDistrictsStateError(e.toString());
      }
    }
  }
}
