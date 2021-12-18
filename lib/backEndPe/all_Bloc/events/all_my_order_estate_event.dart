part of '../blocs/all_my_order_estate_bloc.dart';

@immutable
abstract class AllMyOrderEstateEvent {}


class getAllMyOrderData extends AllMyOrderEstateEvent {}

// ignore: camel_case_types
class singelOrder extends AllMyOrderEstateEvent {
  final int id;

  singelOrder({required this.id});
}


class deleteItemInMyOrder extends AllMyOrderEstateEvent {
  final int id;

  deleteItemInMyOrder({required this.id});
}

// ignore: camel_case_types
class searchInMyOrder extends AllMyOrderEstateEvent {
  final String text;
  searchInMyOrder({required this.text});
}





class  UpdateSingleEvent extends AllMyOrderEstateEvent{
  final Map<String,dynamic> body;
  final int id;
  UpdateSingleEvent({ required this.body,required this.id});
}