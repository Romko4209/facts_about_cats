import 'package:facts_about_cats/auth/auth.dart';
import 'package:facts_about_cats/button_like/bloc/button_like_bloc.dart';
import 'package:facts_about_cats/button_like/bloc/button_like_event.dart';
import 'package:facts_about_cats/button_like/bloc/button_like_state.dart';
import 'package:facts_about_cats/cats/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonLike extends StatelessWidget {
  final Cat favorite;
  ButtonLike(this.favorite);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ButtonLikeBloc>(
      create: (context) => ButtonLikeBloc(InitialState()),
      child: _ButtonLikeWidget(favorite),
    );
  }
}

class _ButtonLikeWidget extends StatelessWidget {
  final Cat favorite;
  _ButtonLikeWidget(this.favorite);

  @override
  Widget build(BuildContext context) {
    final likeBloc = BlocProvider.of<ButtonLikeBloc>(context);
    final user = context.select((AuthenticationBloc bloc) => bloc.state.user);
    return IconButton(
      icon: Icon(Icons.favorite_outline),
      onPressed: () => likeBloc.add(
        AddToFavoriteEvent(favorite: favorite, usertEmail: user.email),
      ),
    );
  }
}
