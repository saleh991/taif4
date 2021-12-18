part of '../blocs/haraje_bloc.dart';

@immutable
abstract class HarajeState {}

class HarajeInitial extends HarajeState {}


class  HarajeStateLoading extends HarajeState{}


class HarajeStateLoaded extends HarajeState{
  DataSingelHeraje dataSingelHeraje;
  HarajeStateLoaded(this.dataSingelHeraje);
}


class HarajeStateError extends HarajeState{
  final String massageError;
  HarajeStateError(this.massageError);
}
