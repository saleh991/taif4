part of '../blocs/haraje_bloc.dart';

@immutable
abstract class HarajeEvent {}


class getSingleHarajeEvent extends HarajeEvent {
  final String id;
  getSingleHarajeEvent({required this.id});
}