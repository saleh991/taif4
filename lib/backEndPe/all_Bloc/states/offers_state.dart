part of '../blocs/offers_bloc.dart';

@immutable
abstract class OffersState {}

class OffersInitial extends OffersState {}



class  offersStateLoading extends OffersState{}


class offersStateLoaded extends OffersState{
  OffersModel dataOffersModel;
  offersStateLoaded(this.dataOffersModel);
}


class offersStateError extends OffersState{
  final String massageError;
  offersStateError(this.massageError);
}
