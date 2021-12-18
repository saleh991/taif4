part of '../blocs/all_notification_bloc.dart';

@immutable
abstract class AllNotificationState {}

class AllNotificationInitial extends AllNotificationState {}


class  AllNotificationLoading extends AllNotificationState{}


class AllNotificationStateLoaded extends AllNotificationState{
  NotificationModel dataNotificationModel;
  AllNotificationStateLoaded(this.dataNotificationModel);
}


class AllNotificationStateError extends AllNotificationState{
  final String massageError;
  AllNotificationStateError(this.massageError);
}