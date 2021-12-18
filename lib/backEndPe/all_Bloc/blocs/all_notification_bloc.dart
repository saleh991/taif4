import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:taif/backEndPe/repository/notification_reposotory.dart';
import 'package:taif/models/notification_model.dart';

part '../events/all_notification_event.dart';
part '../states/all_notification_state.dart';

class AllNotificationBloc extends Bloc<AllNotificationEvent, AllNotificationState> {

 final NotoficationReposotory notoficationReposotory;

  AllNotificationBloc(this.notoficationReposotory) : super(AllNotificationInitial());

  @override
  Stream<AllNotificationState> mapEventToState(
    AllNotificationEvent event,
  ) async* {

    if(event is getAllNotificationData){
      yield  AllNotificationLoading();

      try{
        final fetchData= await notoficationReposotory.getAllDataNotifcaton();
        yield AllNotificationStateLoaded(fetchData);
      }catch(e){
        debugPrint("___________________________----------------"+e.toString());
        yield AllNotificationStateError(e.toString());
      }
    }else if(event is deleteItemInNotofication){

      print(event.id);

      final fetchData= await notoficationReposotory.deleteItemNotification(event.id);
      if(fetchData=="dataMyOrder"){
        try{
          final fetchData= await notoficationReposotory.getAllDataNotifcaton();
          yield AllNotificationStateLoaded(fetchData);
        }catch(e){
          debugPrint("___________________________----------------"+e.toString());
          yield AllNotificationStateError(e.toString());
        }
      }

    }
  }
}
