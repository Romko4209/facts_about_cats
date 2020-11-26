import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:facts_about_cats/tabs/bloc/tab_event.dart';
import 'package:facts_about_cats/tabs/model/app_tab.dart';

class TabBloc extends Bloc<TabEvent, AppTab> {
  TabBloc() : super(AppTab.cats);

  @override
  Stream<AppTab> mapEventToState(TabEvent event) async* {
    if (event is TabUpdated) {
      yield event.tab;
    }
  }
}
