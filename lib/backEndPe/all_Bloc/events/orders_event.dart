part of '../blocs/orders_bloc.dart';

@immutable
abstract class OrdersEvent {}


class getOrdersHomeservicestEvent extends OrdersEvent {
}

class getOrdersLocationServicesEvent extends OrdersEvent {
}

class getOrdersOffersOrdersEvent extends OrdersEvent {
}
