part of '../blocs/estates_bloc.dart';

@immutable
abstract class EstatesState {}

class EstatesInitial extends EstatesState {}



class  EstatesStateLoading extends EstatesState{}


class EstatesStateLoaded extends EstatesState{
  EstateModel estateModel;
  EstatesStateLoaded(this.estateModel);
}


class EstatesStateError extends EstatesState{
  final String massageError;
  EstatesStateError(this.massageError);
}