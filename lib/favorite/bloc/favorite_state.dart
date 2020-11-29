import 'package:flutter/foundation.dart';

abstract class FavoriteState {}

class FavoriteStartState extends FavoriteState {}

class FavoriteEmptyState extends FavoriteState {}

class FavoriteLoadingState extends FavoriteState {}

class FavoriteLoadedState extends FavoriteState {
  List<dynamic> loadedFavorites;

  FavoriteLoadedState({@required this.loadedFavorites})
      : assert(loadedFavorites != null);
}

class ErrorState extends FavoriteState {}
