part of '../blocs/all_notification_bloc.dart';

@immutable
abstract class AllNotificationEvent {}

class getAllNotificationData extends AllNotificationEvent {}

// ignore: camel_case_types
class deleteItemInNotofication extends AllNotificationEvent {
  final int id;

  deleteItemInNotofication({required this.id});
}
