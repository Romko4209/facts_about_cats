import 'package:cached_network_image/cached_network_image.dart';
import 'package:facts_about_cats/auth/auth.dart';
import 'package:facts_about_cats/profile/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => ProfilePage());
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AuthenticationBloc bloc) => bloc.state.user);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                    child: user.photo == null
                        ? Icon(
                            Icons.person,
                            size: 30,
                          )
                        : CachedNetworkImage(
                            imageUrl: user.photo,
                          ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(user.name ?? '', style: textTheme.headline5),
                const SizedBox(height: 10.0),
                Text(user.email, style: textTheme.subtitle1),
                const SizedBox(height: 10.0),
                FlatButton(
                  textColor: Theme.of(context).accentColor,
                  child: const Text(
                    'Log Out',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () => context
                      .read<AuthenticationBloc>()
                      .add(AuthenticationLogoutRequested()),
                ),
                const SizedBox(height: 30.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
