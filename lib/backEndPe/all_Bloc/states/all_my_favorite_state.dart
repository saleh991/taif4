part of '../blocs/all_my_favorite_bloc.dart';

@immutable
abstract class AllMyFavoriteState {}

class AllMyFavoriteInitial extends AllMyFavoriteState {}




class  myFavoriteLoading extends AllMyFavoriteState{}
class  myFavoriteDeleate extends AllMyFavoriteState{}


class myFavoriteLoaded extends AllMyFavoriteState{
  FavoriteModel dataFavoriteModel;
  myFavoriteLoaded(this.dataFavoriteModel);
}


class MyFavoriteEstateStateError extends AllMyFavoriteState{
  final String massageError;
  MyFavoriteEstateStateError(this.massageError);
}