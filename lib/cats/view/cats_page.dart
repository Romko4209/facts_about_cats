import 'package:facts_about_cats/cats/bloc/cat_bloc.dart';
import 'package:facts_about_cats/cats/view/image_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class CatsPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => CatsPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CatBloc(httpClient: http.Client())..add(Fetched()),
      child: ImagesList(),
    );
  }
}
