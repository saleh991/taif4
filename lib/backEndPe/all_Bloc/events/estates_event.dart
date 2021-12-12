part of '../blocs/estates_bloc.dart';

@immutable
abstract class EstatesEvent {}



class getAllEstatesEventData extends EstatesEvent {

 final String url;

  getAllEstatesEventData({required this.url});
}