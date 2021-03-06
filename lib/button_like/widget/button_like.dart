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
      create: (context) => ButtonLikeBloc(ButtonStartState()),
      child: _ButtonLikeWidget(favorite),
    );
  }
}

class _ButtonLikeWidget extends StatelessWidget {
  final Cat favorite;
  _ButtonLikeWidget(this.favorite);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final likeBloc = BlocProvider.of<ButtonLikeBloc>(context);
    final user = context.select((AuthenticationBloc bloc) => bloc.state.user);
    return BlocBuilder<ButtonLikeBloc, ButtonLikeState>(
      builder: (context, state) {
        if (state is ButtonStartState) {
          likeBloc.add(InitialEvent(
            favorite: favorite,
            userEmail: user.email,
          ));
        }
        if (state is InitialState) {
          return IconButton(
            icon: state.isFavorited
                ? Icon(
                    Icons.favorite_sharp,
                    color: Colors.red,
                  )
                : Icon(Icons.favorite_outline),
            onPressed: () => state.isFavorited
                ? likeBloc.add(
                    RemoveToFavoriteEvent(
                      favorite: favorite,
                      userEmail: user.email,
                    ),
                  )
                : likeBloc.add(
                    AddToFavoriteEvent(
                      favorite: favorite,
                      usertEmail: user.email,
                    ),
                  ),
          );
        }
        return const Icon(Icons.favorite_outline);
      },
    );
  }
}
