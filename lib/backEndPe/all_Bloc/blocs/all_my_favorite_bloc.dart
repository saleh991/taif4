import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:taif/backEndPe/repository/my_my_favorit.dart';
import 'package:taif/models/favorite_model.dart';

part '../events/all_my_favorite_event.dart';
part '../states/all_my_favorite_state.dart';

class AllMyFavoriteBloc extends Bloc<AllMyFavoriteEvent, AllMyFavoriteState> {

  final MyFavoriteReposotory myFavoriteReposotory;

  AllMyFavoriteBloc(this.myFavoriteReposotory) : super(AllMyFavoriteInitial());

  @override
  Stream<AllMyFavoriteState> mapEventToState(
    AllMyFavoriteEvent event,
  ) async* {
    if(event is getAllMyFavoriteData){
      yield  myFavoriteLoading();

      try{
        final fetchData= await myFavoriteReposotory.getAllMMyFavorite();
        yield myFavoriteLoaded(fetchData);
      }catch(e){
        debugPrint("___________________________----------------"+e.toString());
        yield MyFavoriteEstateStateError(e.toString());
      }
    }if(event is deleteItemInMyFavorite){
      yield  myFavoriteLoading();
      final fetchData= await myFavoriteReposotory.deleteItemMyFavorite(event.id);
      try{
        final fetchData= await myFavoriteReposotory.getAllMMyFavorite();
        yield myFavoriteLoaded(fetchData);
      }catch(e){
        debugPrint("___________________________----------------"+e.toString());
        yield MyFavoriteEstateStateError(e.toString());
      }
    }
  }
}
