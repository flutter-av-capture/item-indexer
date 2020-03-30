// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:app_core/app_core.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:item_indexer/actions/actions.dart';
import 'package:item_indexer/models/models.dart';
import 'package:item_indexer/presentation/add_item_screen.dart';
import 'package:item_indexer/presentation/keys.dart';

class AddItem extends StatelessWidget {
  AddItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OnSaveCallback>(
      converter: (Store<AppState> store) {
        return (item, bin) {
          store.dispatch(AddItemAction(Item(
            item,
            bin
          )));
        };
      },
      builder: (BuildContext context, OnSaveCallback onSave) {
        return AddItemScreen(
          key: ItemIndexerKeys.addItemScreen,
          onSave: onSave,
          isEditing: false,
        );
      },
    );
  }
}