import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:taif/backEndPe/repository/know_taif_reposotory.dart';
import 'package:taif/models/taif_model.dart';

part '../events/know_taif_event.dart';
part '../states/know_taif_state.dart';




class KnowTaifBloc extends Bloc<KnowTaifEvent, KnowTaifState> {



  final KnowTaifRepostory _knowTaifRepostory;

  KnowTaifBloc(this._knowTaifRepostory) : super(KnowTaifInitial());

  @override
  Stream<KnowTaifState> mapEventToState(
      KnowTaifEvent event,
      ) async* {
    if(event is getKnowTaifEvent){
      yield  KnowTaifStateLoading();

      try{
        final fetchData= await _knowTaifRepostory.getAllKnowTaif();
        yield KnowTaifStateLoaded(fetchData);
      }catch(e){
        debugPrint("___________________________----------------"+e.toString());
        yield KnowTaifStateError(e.toString());
      }
    }
  }

}
