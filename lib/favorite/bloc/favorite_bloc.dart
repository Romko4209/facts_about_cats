import 'package:bloc/bloc.dart';
import 'package:facts_about_cats/cats/models/models.dart';
import 'package:facts_about_cats/favorite/bloc/favorite_event.dart';
import 'package:facts_about_cats/favorite/bloc/favorite_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc(FavoriteState initialState) : super(FavoriteStartState());

  @override
  Stream<FavoriteState> mapEventToState(FavoriteEvent event) async* {
    if (event is FavoriteLoadEvent) {
      yield FavoriteLoadingState();
      try {
        final List<Cat> _loadedFavoriteList =
            await getFavoriteImages(event.userEmail);
        if (_loadedFavoriteList.isEmpty) yield FavoriteEmptyState();
        yield FavoriteLoadedState(loadedFavorites: _loadedFavoriteList);
      } catch (_) {
        yield ErrorState();
      }
    }
  }

  Future<List<Cat>> getFavoriteImages(String userEmail) async {
    var collectionReference = FirebaseFirestore.instance
        .collection('users')
        .doc(userEmail)
        .collection('images');
    // ignore: deprecated_member_use
    var querySnaphot = await collectionReference.getDocuments();
    var list = <Cat>[];
    // ignore: deprecated_member_use
    for (var item in querySnaphot.documents) {
      final data = item.data();
      list.add(
        Cat(
            id: data['id'] as String,
            imageURL: data['imageURL'] as String,
            fact: data['fact'] as String),
      );
    }
    return list;
  }
}
