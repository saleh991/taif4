part of '../blocs/all_my_favorite_bloc.dart';

@immutable
abstract class AllMyFavoriteEvent {}



class getAllMyFavoriteData extends AllMyFavoriteEvent {}

// ignore: camel_case_types
class deleteItemInMyFavorite extends AllMyFavoriteEvent {
  final int id;

  deleteItemInMyFavorite({required this.id});
}