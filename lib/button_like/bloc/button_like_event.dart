import 'package:facts_about_cats/cats/models/models.dart';
import 'package:flutter/material.dart';

abstract class ButtonLikeEvent {}

class AddToFavoriteEvent extends ButtonLikeEvent {
  AddToFavoriteEvent({@required this.favorite, @required this.usertEmail});
  final Cat favorite;
  final String usertEmail;
}

class RemoveToFavoriteEvent extends ButtonLikeEvent {
  RemoveToFavoriteEvent({@required this.favorite, @required this.usertEmail});
  final Cat favorite;
  final String usertEmail;
}
