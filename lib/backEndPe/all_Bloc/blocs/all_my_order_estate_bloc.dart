import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:taif/backEndPe/repository/my_order_state.dart';
import 'package:taif/models/DataSingleOrderState.dart';
import 'package:taif/models/estate_model.dart';

part '../events/all_my_order_estate_event.dart';
part '../states/all_my_order_estate_state.dart';

class AllMyOrderEstateBloc extends Bloc<AllMyOrderEstateEvent, AllMyOrderEstateState> {

  final MyOrderReposotory myOrderReposotory;


  AllMyOrderEstateBloc(this.myOrderReposotory) : super(AllMyOrderEstateInitial());

  @override
  Stream<AllMyOrderEstateState> mapEventToState(
    AllMyOrderEstateEvent event,
  ) async* {


    if(event is getAllMyOrderData){
      yield  AllMyOrderEstateStateLoading();

      try{
        final fetchData= await myOrderReposotory.getAllDataMyOrder();
        yield AllMyOrderEstateStateLoaded(fetchData);
      }catch(e){
        debugPrint("___________________________----------------"+e.toString());
        yield AllMyOrderEstateStateError(e.toString());
      }
    }

    else if(event is singelOrder){
      yield  AllMyOrderEstateStateLoading();
      try{
        final fetchData= await myOrderReposotory.singelOrderState(event.id);
        yield SingleOrderState(fetchData);
      }catch(e){
        debugPrint("___________________________----------------"+e.toString());
        yield AllMyOrderEstateStateError(e.toString());
      }
    }

    else if(event is UpdateSingleEvent){
      yield  updateMyOrderEstateStateLoading();
      try{
        final fetchData= await myOrderReposotory.updateSingelOrderState(body: event.body,id: event.id);
        yield UpdateDineSingleOrderState(fetchData);
      }catch(e){
        debugPrint("___________________________----------------"+e.toString());
        yield AllMyOrderEstateStateError(e.toString());
      }
    }

    else if(event is searchInMyOrder){
      yield  AllMyOrderEstateStateLoading();

      try{
        final fetchData= await myOrderReposotory.serachInMyOrder(event.text);
        yield AllMyOrderEstateStateLoaded(fetchData);
      }catch(e){
        debugPrint("___________________________----------------"+e.toString());
        yield AllMyOrderEstateStateError(e.toString());
      }
    }else if(event is deleteItemInMyOrder){
      yield AllMyOrderEstateStateDeleate();
      print(event.id);

      final fetchData= await myOrderReposotory.deleteItemMyOrder(event.id);
      if(fetchData=="dataMyOrder"){
        try{
          final fetchData= await myOrderReposotory.getAllDataMyOrder();
          yield AllMyOrderEstateStateLoaded(fetchData);
        }catch(e){
          debugPrint("___________________________----------------"+e.toString());
          yield AllMyOrderEstateStateError(e.toString());
        }
      }

    }
  }
}
