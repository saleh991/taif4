part of '../blocs/location_services_bloc.dart';

@immutable
abstract class LocationServicesState {}

class LocationServicesInitial extends LocationServicesState {}
class LocationServicesLoding extends LocationServicesState {}


class LocationServicesStateLoaded extends LocationServicesState{
  DataSingelLocationService dataSingelLocationService;
  LocationServicesStateLoaded(this.dataSingelLocationService);
}


class LocationServicesStateError extends LocationServicesState{
  final String massageError;
  LocationServicesStateError(this.massageError);
}
