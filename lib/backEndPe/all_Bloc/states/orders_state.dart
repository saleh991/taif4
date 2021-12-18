part of '../blocs/orders_bloc.dart';

@immutable
abstract class OrdersState {}

class OrdersInitial extends OrdersState {}



class  OrdersStateLoading extends OrdersState{}


// Homeservices  LocationService   OffersOrders

class OrderHomeservicesLoaded extends OrdersState{
  DataOrderHomeservices dataOrderHomeservices;
  OrderHomeservicesLoaded(this.dataOrderHomeservices);
}

class OrderLocationServiceStateLoaded extends OrdersState{
  DataOrderlocationServices dataOrderlocationServices;
  OrderLocationServiceStateLoaded(this.dataOrderlocationServices);
}

class OrderOffersOrdersLoaded extends OrdersState{
  DataOrderOffers dataOrderOffers;
  OrderOffersOrdersLoaded(this.dataOrderOffers);
}


class OrdersStateError extends OrdersState{
  final String massageError;
  OrdersStateError(this.massageError);
}
