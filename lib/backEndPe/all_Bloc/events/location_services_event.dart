part of '../blocs/location_services_bloc.dart';

@immutable
abstract class LocationServicesEvent {}


class getSingleLocationServicesEvent extends LocationServicesEvent {
  final String id;
  getSingleLocationServicesEvent({required this.id});
}