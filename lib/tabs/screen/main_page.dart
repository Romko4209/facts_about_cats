import 'package:facts_about_cats/cats/view/cats_page.dart';
import 'package:facts_about_cats/favorite/screen/favorite_page.dart';
import 'package:facts_about_cats/profile/view/profile_page.dart';
import 'package:facts_about_cats/tabs/bloc/tab.dart';
import 'package:facts_about_cats/tabs/model/app_tab.dart';
import 'package:facts_about_cats/tabs/widgets/tab_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, AppTab>(
      builder: (context, activeTab) {
        String selectedPageTitle;
        Widget page;
        switch (activeTab) {
          case AppTab.cats:
            selectedPageTitle = 'Cats';
            page = CatsPage();
            break;
          case AppTab.favorite:
            selectedPageTitle = 'Favorite';
            page = FavoritePage();
            break;
          case AppTab.profile:
            selectedPageTitle = 'Profile';
            page = ProfilePage();
            break;
          default:
            break;
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              selectedPageTitle,
              // ignore: deprecated_member_use
              style: Theme.of(context).accentTextTheme.title,
            ),
            centerTitle: true,
          ),
          body: page,
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) =>
                BlocProvider.of<TabBloc>(context).add(TabUpdated(tab)),
          ),
        );
      },
    );
  }
}
