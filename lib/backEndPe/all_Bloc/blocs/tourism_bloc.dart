import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:taif/backEndPe/all_Bloc/blocs/know_taif_bloc.dart';
import 'package:taif/backEndPe/repository/tourism_repostory.dart';
import 'package:taif/models/DataCarTourism.dart';
import 'package:taif/models/DataTourismList.dart';

part '../events/tourism_event.dart';
part '../states/tourism_state.dart';

class TourismBloc extends Bloc<TourismEvent, TourismState> {



  final TourismRepostory tourismRepostory;

  TourismBloc(this.tourismRepostory) : super(TourismInitial());

  @override
  Stream<TourismState> mapEventToState(
      TourismEvent event,
      ) async* {
    if(event is getTourismCatEvent){
      yield  TourismStateLoading();

      try{
        final fetchData= await tourismRepostory.getAllCarTourism();
        yield TourismStateCatLoaded(fetchData);
      }catch(e){
        debugPrint("___________________________----------------"+e.toString());
        yield TourismStateError(e.toString());
      }
    }

    if(event is getTourismListEvent){
      yield  TourismStateLoading();

      try{
        final fetchData= await tourismRepostory.getAllTourism(event.idCat);
        yield TourismStateListLoaded(fetchData);
      }catch(e){
        debugPrint("___________________________----------------"+e.toString());
        yield TourismStateError(e.toString());
      }
    }
  }

}