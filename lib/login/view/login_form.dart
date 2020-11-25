import 'package:facts_about_cats/login/cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'FACTS ABOUT CATS',
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'DancingScript',
            ),
          ),
          const SizedBox(height: 10.0),
          Image.asset(
            'assets/image/cat_walking.png',
            height: 120,
          ),
          const SizedBox(height: 8.0),
          _GoogleLoginButton(),
        ],
      ),
    );
  }
}

class _GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RaisedButton.icon(
      key: const Key('loginForm_googleLogin_raisedButton'),
      label: const Text(
        'SIGN IN WITH GOOGLE',
        style: TextStyle(color: Colors.white),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      icon: const Icon(FontAwesomeIcons.google, color: Colors.white),
      color: theme.primaryColor,
      onPressed: () => context.read<LoginCubit>().logInWithGoogle(),
    );
  }
}
