// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:item_indexer/models/models.dart';
import 'package:item_indexer/presentation/list_screen.dart';
import 'package:item_indexer/presentation/keys.dart';
import 'package:item_indexer/selectors/selectors.dart';

class ListScreenContainer extends StatelessWidget{
  ListScreenContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel vm) {
        return ListScreen(
          key: ItemIndexerKeys.itemList,
          items: vm.items,
          
        );
      },
    );
  }
}

class _ViewModel{
  final List<Item> items;


  _ViewModel({
    @required this.items,

  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      items: itemsSelector(store.state),
      );
  }
}