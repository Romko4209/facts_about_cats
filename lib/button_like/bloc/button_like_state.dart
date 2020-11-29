import 'package:flutter/material.dart';

abstract class ButtonLikeState {}

class InitialState extends ButtonLikeState {
  InitialState({@required this.isFavorited});
  final bool isFavorited;
}

class ErrorState extends ButtonLikeState {}

class ButtonStartState extends ButtonLikeState {}
