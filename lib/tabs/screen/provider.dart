import 'package:facts_about_cats/tabs/bloc/tab.dart';
import 'package:facts_about_cats/tabs/screen/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabProvider extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => TabProvider());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TabBloc>(
      create: (context) => TabBloc(),
      child: MainPage(),
    );
  }
}
