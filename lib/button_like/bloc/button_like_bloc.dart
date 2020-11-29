import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facts_about_cats/button_like/bloc/button_like_event.dart';
import 'package:facts_about_cats/button_like/bloc/button_like_state.dart';
import 'package:facts_about_cats/cats/models/models.dart';

class ButtonLikeBloc extends Bloc<ButtonLikeEvent, ButtonLikeState> {
  ButtonLikeBloc(ButtonLikeState initialState) : super(initialState);

  @override
  Stream<ButtonLikeState> mapEventToState(ButtonLikeEvent event) {
    if (event is AddToFavoriteEvent) {
      print('added');
    } else if (event is RemoveToFavoriteEvent) {
      print('deleted');
    }
  }

  dynamic addToFavourite(Cat favorite, String userEmail) {
    var data = <String, dynamic>{
      'id': favorite.id,
      'imageURL': favorite.imageURL,
      'fact': favorite.fact
    };
    var collectionReference = FirebaseFirestore.instance
        .collection('users')
        .doc(userEmail)
        .collection('images')
        .doc(favorite.id);
    print(1234);
    collectionReference.set(data);
  }
}
