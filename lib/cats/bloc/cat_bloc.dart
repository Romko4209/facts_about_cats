import 'dart:async';
import 'dart:convert' as convert;

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:facts_about_cats/cats/models/models.dart';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  CatBloc({@required this.httpClient}) : super(const CatState());

  final http.Client httpClient;
  static const int limitPage = 20;

  @override
  Stream<CatState> mapEventToState(CatEvent event) async* {
    if (event is Fetched) {
      yield await _mapImageFetchedToState(state);
    }
  }

  Future<CatState> _mapImageFetchedToState(CatState state) async {
    if (state.hasReachedMax) return state;
    try {
      if (state.status == CatStatus.initial) {
        final cats = await _createCats(0);
        return state.copyWith(
          status: CatStatus.success,
          cats: cats,
          hasReachedMax: false,
        );
      }
      final cats = await _createCats(state.cats.length);
      return cats.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: CatStatus.success,
              cats: List.of(state.cats)..addAll(cats),
              hasReachedMax: false,
            );
    } on Exception {
      return state.copyWith(status: CatStatus.failure);
    }
  }

  Future<List<ImageCat>> _fetchImages() async {
    final response = await httpClient.get(
      'https://api.thecatapi.com/v1/images/search?mime_types=jpg&limit=$limitPage',
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body) as List;
      return data.map((dynamic apiCat) {
        return ImageCat(
          id: apiCat['id'] as String,
          imageURL: apiCat['url'] as String,
        );
      }).toList();
    }
    throw Exception('error fetching pictures');
  }

  Future<List<FactCat>> _fetchFacts(int indexItem) async {
    final page = indexItem / limitPage;
    final response = await http.get(
      'https://catfact.ninja/facts?limit=$limitPage&page=$page',
    );
    if (response.statusCode == 200) {
      dynamic json = convert.jsonDecode(response.body);
      var list = <FactCat>[];
      for (var item in json['data']) {
        list.add(FactCat(fact: item['fact'] as String));
      }
      return list;
    }
    throw Exception('error fetching facts');
  }

  Future<List<Cat>> _createCats(int index) async {
    var images = await _fetchImages();
    var facts = await _fetchFacts(index);
    var list = <Cat>[];
    for (var i = 0; i < limitPage; i++) {
      list.add(Cat(
          id: images[i].id, imageURL: images[i].imageURL, fact: facts[i].fact));
      final data = <String, dynamic>{
        'id': images[i].id,
        'imageURL': images[i].imageURL,
        'fact': facts[i].fact
      };
      FirebaseFirestore.instance.collection('images').doc('$i').set(data);
    }
    return list;
  }
}
