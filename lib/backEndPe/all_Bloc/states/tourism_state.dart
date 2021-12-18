part of '../blocs/tourism_bloc.dart';

@immutable
abstract class TourismState {}

class TourismInitial extends TourismState {}



class  TourismStateLoading extends TourismState{}


class TourismStateCatLoaded extends TourismState{
  DataCarTourism dataTourism;
  TourismStateCatLoaded(this.dataTourism);
}

class TourismStateListLoaded extends TourismState{
  DataTourismList dataTourismList;
  TourismStateListLoaded(this.dataTourismList);
}


class TourismStateError extends TourismState{
  final String massageError;
  TourismStateError(this.massageError);
}
