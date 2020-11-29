import 'package:facts_about_cats/favorite/bloc/favorite_bloc.dart';
import 'package:facts_about_cats/favorite/bloc/favorite_state.dart';
import 'package:facts_about_cats/favorite/widgets/favorite_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoriteBloc>(
      create: (context) => FavoriteBloc(FavoriteStartState()),
      child: FavoriteList(),
    );
  }
}
