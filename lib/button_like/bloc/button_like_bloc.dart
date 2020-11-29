import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facts_about_cats/button_like/bloc/button_like_event.dart';
import 'package:facts_about_cats/button_like/bloc/button_like_state.dart';
import 'package:facts_about_cats/cats/models/models.dart';

class ButtonLikeBloc extends Bloc<ButtonLikeEvent, ButtonLikeState> {
  ButtonLikeBloc(ButtonLikeState initialState) : super(initialState);

  @override
  Stream<ButtonLikeState> mapEventToState(ButtonLikeEvent event) async* {
    if (event is InitialEvent) {
      try {
        var favorited = await isFavorited(event.favorite, event.userEmail);

        yield InitialState(isFavorited: favorited);
      } catch (_) {
        yield ErrorState();
      }
    }
    if (event is AddToFavoriteEvent) {
      try {
        _addToFavourite(event.favorite, event.usertEmail);
        print('added');
        yield InitialState(isFavorited: true);
      } catch (_) {
        yield ErrorState();
      }
    }
    if (event is RemoveToFavoriteEvent) {
      try {
        _deleteFavorite(event.favorite, event.userEmail);
        print('removed');
        yield InitialState(isFavorited: false);
      } catch (_) {
        yield ErrorState();
      }
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

  dynamic _deleteFavorite(Cat favorite, String userEmail) {
    var collectionReference = FirebaseFirestore.instance
        .collection('users')
        .doc(userEmail)
        .collection('images')
        .doc(favorite.id);
    collectionReference.delete();
  }

  Future<bool> isFavorited(Cat favorite, String userEmail) async {
    var collectionReference = FirebaseFirestore.instance
        .collection('users')
        .doc(userEmail)
        .collection('images');

    // ignore: deprecated_member_use
    var querySnaphot = await collectionReference.getDocuments();

    // ignore: deprecated_member_use
    for (var item in querySnaphot.documents) {
      final data = item.data();
      if (data['id'] as String == favorite.id) {
        return true;
      }
    }

    return false;
  }
}
