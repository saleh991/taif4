import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taif/backEndPe/repository/estates.dart';
import 'package:taif/models/estate_model.dart';

part '../events/estates_event.dart';
part '../states/estates_state.dart';

class EstatesBloc extends Bloc<EstatesEvent, EstatesState> {

  final EstatesRepostory estatesRepostory;

  EstatesBloc(this.estatesRepostory) : super(EstatesInitial());

  @override
  Stream<EstatesState> mapEventToState(
    EstatesEvent event,
  ) async* {
    if(event is getAllEstatesEventData){
      yield  EstatesStateLoading();

      try{
        final fetchData= await estatesRepostory.getAllEstate(event.url);
        yield EstatesStateLoaded(fetchData);
      }catch(e){
        yield EstatesStateError(e.toString());
      }
    }
    // if(event is deleteItemInMyFavorite){
    //   yield  myFavoriteLoading();
    //   final fetchData= await myFavoriteReposotory.deleteItemMyFavorite(event.id);
    //   try{
    //     final fetchData= await myFavoriteReposotory.getAllMMyFavorite();
    //     yield myFavoriteLoaded(fetchData);
    //   }catch(e){
    //     debugPrint("___________________________----------------"+e.toString());
    //     yield MyFavoriteEstateStateError(e.toString());
    //   }
    // }

  }
}
