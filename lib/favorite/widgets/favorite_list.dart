import 'package:facts_about_cats/auth/auth.dart';
import 'package:facts_about_cats/cats/models/models.dart';
import 'package:facts_about_cats/cats/widgets/widgets.dart';
import 'package:facts_about_cats/favorite/bloc/favorite_bloc.dart';
import 'package:facts_about_cats/favorite/bloc/favorite_event.dart';
import 'package:facts_about_cats/favorite/bloc/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<FavoriteBloc>(context);
    final user = context.select((AuthenticationBloc bloc) => bloc.state.user);
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteStartState) {
          userBloc.add(FavoriteLoadEvent(user.email));
        }

        if (state is FavoriteEmptyState) {
          return Center(
            child: Text(
              'No any favorite cats!',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }

        if (state is FavoriteLoadingState) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is FavoriteLoadedState) {
          return ListView.builder(
            itemCount: state.loadedFavorites.length,
            itemBuilder: (context, index) => ListItem(
                cat: state.loadedFavorites[index] as Cat, routeToDetail: true),
          );
        }
        if (state is ErrorState) {
          return Center(
            child: Text(
              'Error fetching data!',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
