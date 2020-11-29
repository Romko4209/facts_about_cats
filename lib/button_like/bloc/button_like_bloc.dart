import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facts_about_cats/button_like/bloc/button_like_event.dart';
import 'package:facts_about_cats/button_like/bloc/button_like_state.dart';
import 'package:facts_about_cats/cats/models/models.dart';

class ButtonLikeBloc extends Bloc<ButtonLikeEvent, ButtonLikeState> {
  ButtonLikeBloc(ButtonLikeState initialState) : super(initialState);

  @override
  Stream<ButtonLikeState> mapEventToState(ButtonLikeEvent event) async* {
    if (event is AddToFavoriteEvent) {
      try {
        _addToFavourite(event.favorite, event.usertEmail);
      } catch (_) {
        yield ErrorState();
      }
    } else if (event is RemoveToFavoriteEvent) {
      print('deleted');
    }
  }

  dynamic _addToFavourite(Cat favorite, String userEmail) {
    final data = <String, dynamic>{
      'id': favorite.id,
      'imageURL': favorite.imageURL,
      'fact': favorite.fact
    };
    var collectionReference = FirebaseFirestore.instance
        .collection('users')
        .doc(userEmail)
        .collection('images')
        .doc(favorite.id);

    collectionReference.set(data);
  }
}
