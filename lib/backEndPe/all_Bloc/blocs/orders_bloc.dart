import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:taif/backEndPe/repository/orders_repostory.dart';
import 'package:taif/models/DataOrderHomeservices.dart';
import 'package:taif/models/DataOrderOffers.dart';
import 'package:taif/models/DataOrderlocationServices.dart';

part '../events/orders_event.dart';
part '../states/orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {



  final OrderRepostory orderRepostory;

  OrdersBloc(this.orderRepostory) : super(OrdersInitial());

  @override
  Stream<OrdersState> mapEventToState(
      OrdersEvent event,
      ) async* {
    if(event is getOrdersHomeservicestEvent){
      yield  OrdersStateLoading();

      try{
        final fetchData= await orderRepostory.getAllOrderHomeservices();
        yield OrderHomeservicesLoaded(fetchData);
      }catch(e){
        debugPrint("___________________________----------------"+e.toString());
        yield OrdersStateError(e.toString());
      }
    }
    if(event is getOrdersLocationServicesEvent){
      yield  OrdersStateLoading();

      try{
        final fetchData= await orderRepostory.getAllOrderLocationServices();
        yield OrderLocationServiceStateLoaded(fetchData);
      }catch(e){
        debugPrint("___________________________----------------"+e.toString());
        yield OrdersStateError(e.toString());
      }
    }

    if(event is getOrdersOffersOrdersEvent){
      yield  OrdersStateLoading();

      try{
        final fetchData= await orderRepostory.getAllOrderOffersOrders();
        yield OrderOffersOrdersLoaded(fetchData);
      }catch(e){
        debugPrint("___________________________----------------"+e.toString());
        yield OrdersStateError(e.toString());
      }
    }
  }

}
