import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:taif/backEndPe/repository/offers_reposotory.dart';
import 'package:taif/models/offers_model.dart';

part '../events/offers_event.dart';
part '../states/offers_state.dart';

class OffersBloc extends Bloc<OffersEvent, OffersState> {



  final OffersRepostory _offersRepostory;

  OffersBloc(this._offersRepostory) : super(OffersInitial());

  @override
  Stream<OffersState> mapEventToState(
      OffersEvent event,
      ) async* {
    if(event is getOffersEventEvent){
      yield  offersStateLoading();

      try{
        final fetchData= await _offersRepostory.getAllOffers();
        yield offersStateLoaded(fetchData);
      }catch(e){
        debugPrint("___________________________----------------"+e.toString());
        yield offersStateError(e.toString());
      }
    }
  }

}
