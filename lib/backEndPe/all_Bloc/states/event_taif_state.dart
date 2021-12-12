part of '../blocs/event_taif_bloc.dart';

@immutable
abstract class EventTaifState {}

class EventTaifInitial extends EventTaifState {}



class  EventTaifLoading extends EventTaifState{}


class EventTaifStateLoaded extends EventTaifState{
  EventModel dataEventModel;
  EventTaifStateLoaded(this.dataEventModel);
}


class EventTaifStateError extends EventTaifState{
  final String massageError;
  EventTaifStateError(this.massageError);
}
