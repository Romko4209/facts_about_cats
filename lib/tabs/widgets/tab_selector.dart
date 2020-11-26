import 'package:facts_about_cats/tabs/model/app_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TabSelector extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  TabSelector({
    @required this.activeTab,
    @required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
      currentIndex: AppTab.values.indexOf(activeTab),
      onTap: (index) => onTabSelected(AppTab.values[index]),
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.list),
          title: Text('Cats'),
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.star),
          title: Text('Favorite'),
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
        ),
      ],
    );
  }
}
