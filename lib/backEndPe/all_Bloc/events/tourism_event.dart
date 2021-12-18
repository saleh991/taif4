part of '../blocs/tourism_bloc.dart';

@immutable
abstract class TourismEvent {}


class getTourismCatEvent extends TourismEvent {
}



class getTourismListEvent extends TourismEvent {

  String idCat;
  getTourismListEvent({required this.idCat});

}