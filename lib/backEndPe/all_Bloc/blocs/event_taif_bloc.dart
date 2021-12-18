import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taif/backEndPe/repository/event_taif_repository.dart';
import 'package:taif/models/event_model.dart';

part '../events/event_taif_event.dart';
part '../states/event_taif_state.dart';

class EventTaifBloc extends Bloc<EventTaifEvent, EventTaifState> {



  final EventTaifRepository eventTaifRepository;
  EventTaifBloc(this.eventTaifRepository) : super(EventTaifInitial());

  @override
  Stream<EventTaifState> mapEventToState(
      EventTaifEvent event,
      ) async* {
    if(event is getEventTaifEventeEvent){
      yield  EventTaifLoading();

      try{
        final fetchData= await eventTaifRepository.getAllEventTaif();
        yield EventTaifStateLoaded(fetchData);
      }catch(e){
        yield EventTaifStateError(e.toString());
      }
    }
  }


}
