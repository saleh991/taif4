part of '../blocs/all_my_order_estate_bloc.dart';

@immutable
abstract class AllMyOrderEstateState {}

class AllMyOrderEstateInitial extends AllMyOrderEstateState {}



class  AllMyOrderEstateStateLoading extends AllMyOrderEstateState{}

class  updateMyOrderEstateStateLoading extends AllMyOrderEstateState{}

class  AllMyOrderEstateStateDeleate extends AllMyOrderEstateState{}


class  SingleOrderState extends AllMyOrderEstateState{
  final DataSingleOrderState singleOrder;
  SingleOrderState(this.singleOrder);
}


class  UpdateDineSingleOrderState extends AllMyOrderEstateState{
  final bool singleOrder;
  UpdateDineSingleOrderState(this.singleOrder);
}








class AllMyOrderEstateStateLoaded extends AllMyOrderEstateState{
  EstateModel dataEstateModelModel;
  AllMyOrderEstateStateLoaded(this.dataEstateModelModel);
}


class AllMyOrderEstateStateError extends AllMyOrderEstateState{
  final String massageError;
  AllMyOrderEstateStateError(this.massageError);
}