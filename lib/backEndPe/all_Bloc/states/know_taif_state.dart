part of '../blocs/know_taif_bloc.dart';

@immutable
abstract class KnowTaifState {}

class KnowTaifInitial extends KnowTaifState {}



class  KnowTaifStateLoading extends KnowTaifState{}


class KnowTaifStateLoaded extends KnowTaifState{
  TaifModel dataTaifModel;
  KnowTaifStateLoaded(this.dataTaifModel);
}


class KnowTaifStateError extends KnowTaifState{
  final String massageError;
  KnowTaifStateError(this.massageError);
}
