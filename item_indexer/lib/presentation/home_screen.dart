// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:redux_sample/presentation/keys.dart';
import 'package:redux_sample/presentation/add_item_screen.dart';
import 'package:redux_sample/presentation/list_screen.dart';

import '../containers/active_tab.dart';
import '../containers/extra_actions_container.dart';
import '../containers/filter_selector.dart';
import '../containers/filtered_todos.dart';
import '../containers/stats.dart';
import '../containers/tab_selector.dart';
import '../localization.dart';
import '../models/app_tab.dart';

class HomeScreen extends StatefulWidget {
  final void Function() onInit;

  HomeScreen({@required this.onInit}) : super(key: ItemIndexerKeys.homeScreen);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    widget.onInit();
    super.initState();

  // int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // static List<Widget> _widgetOptions = <Widget>[
  //   AddItemScreen(),
  //   ListScreen(),
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  }

  @override
  Widget build(BuildContext context) {
    return ActiveTab(
      builder: (BuildContext context, AppTab activeTab) {
        return Scaffold(
          appBar: AppBar(
            title: Text(ReduxLocalizations.of(context).appTitle),
            actions: [
              FilterSelector(visible: activeTab == AppTab.items),
              ExtraActionsContainer(),
            ],
          ),
          body: activeTab == AppTab.items ? FilteredTodos() : Stats(),
          floatingActionButton: FloatingActionButton(
            key: ItemIndexerKeys.addItemFab,
            onPressed: () {
              Navigator.pushNamed(context, ArchSampleRoutes.addTodo);
            },
            child: Icon(Icons.add),
            tooltip: ArchSampleLocalizations.of(context).addItem,
          ),
          bottomNavigationBar: TabSelector(),
        );
      },
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Inventory'),
    //   ),
    //   body: Center(
    //     child: _widgetOptions.elementAt(_selectedIndex),
    //   ),
    //   bottomNavigationBar: BottomNavigationBar(
    //     items: const <BottomNavigationBarItem>[
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.add),
    //         title: Text('Add Item'),
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.view_list),
    //         title: Text('Item List'),
    //       ),
    //     ],
    //     currentIndex: _selectedIndex,
    //     selectedItemColor: Colors.amber[800],
    //     onTap: _onItemTapped,
    //   ),
    // );
  }
}
