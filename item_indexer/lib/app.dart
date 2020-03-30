import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:item_indexer/actions/actions.dart';
import 'package:item_indexer/containers/add_todo.dart';
import 'package:item_indexer/containers/add_item.dart';
import 'package:item_indexer/containers/list_screen.dart';
import 'package:item_indexer/localization.dart';
import 'package:item_indexer/models/models.dart';
import 'package:item_indexer/presentation/home_screen.dart';
import 'package:app_core/app_core.dart';

class ReduxApp extends StatelessWidget {
  final Store<AppState> store;

  const ReduxApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        onGenerateTitle: (context) => ReduxLocalizations.of(context).appTitle,
        theme: ArchSampleTheme.theme,
        localizationsDelegates: [
          ArchSampleLocalizationsDelegate(),
          ReduxLocalizationsDelegate(),
        ],
        routes: {
          ArchSampleRoutes.home: (context) {
            return HomeScreen(
              onInit: () {
                StoreProvider.of<AppState>(context).dispatch(LoadTodosAction());
              },
            );
          },
          ArchSampleRoutes.addTodo: (context) {
            return AddTodo();
          },
          ArchSampleRoutes.addItem: (context) {
            return AddItem();
          },
          ArchSampleRoutes.viewItems: (context) {
            return ListScreenContainer();
          }
        },
      ),
    );
  }
}
