part of 'cat_bloc.dart';

abstract class CatEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Fetched extends CatEvent {}
