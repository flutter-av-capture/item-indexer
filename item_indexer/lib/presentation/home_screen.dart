import 'package:flutter/material.dart';
import 'package:app_core/app_core.dart';
import 'package:item_indexer/containers/active_tab.dart';
import 'package:item_indexer/containers/extra_actions_container.dart';
import 'package:item_indexer/containers/filter_selector.dart';
import 'package:item_indexer/containers/filtered_todos.dart';
import 'package:item_indexer/containers/list_screen.dart';
import 'package:item_indexer/containers/stats.dart';
import 'package:item_indexer/containers/tab_selector.dart';
import 'package:item_indexer/localization.dart';
import 'package:item_indexer/models/models.dart';

class HomeScreen extends StatefulWidget {
  final void Function() onInit;

  HomeScreen({@required this.onInit}) : super(key: ArchSampleKeys.homeScreen);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
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
          ), //TODO call Matthew's wrapper here
          body: activeTab == AppTab.items ? ListScreenContainer() : Stats(),
          floatingActionButton: FloatingActionButton(
            key: ArchSampleKeys.addTodoFab,
            onPressed: () {
              Navigator.pushNamed(context, ArchSampleRoutes.addItem);
            },
            child: Icon(Icons.add),
            tooltip: ArchSampleLocalizations.of(context).addTodo,
          ),
          bottomNavigationBar: TabSelector(),
        );
      },
    );
  }
}