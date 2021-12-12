part of '../blocs/districts_bloc.dart';

@immutable
abstract class DistrictsState {}

class DistrictsInitial extends DistrictsState {}




class  AllDistrictsLoading extends DistrictsState{}


class AllDistrictsStateLoaded extends DistrictsState{
  DataDistricts dataDistricts;
  AllDistrictsStateLoaded(this.dataDistricts);
}


class AllDistrictsStateError extends DistrictsState{
  final String massageError;
  AllDistrictsStateError(this.massageError);
}