// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:app_core/app_core.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:item_indexer/actions/actions.dart';
import 'package:item_indexer/models/models.dart';
import 'package:item_indexer/presentation/add_edit_screen.dart';

class EditItem extends StatelessWidget {
  final Item item;

  EditItem({this.item, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OnSaveCallback>(
      converter: (Store<AppState> store) {
        
        if(this.item.checkedOut){
          return (name, bin) {
            store.dispatch(CheckinItemAction(
              item.id
            ));
          };
        } else {
          return (name, bin) {
            store.dispatch(CheckoutItemAction(
              item.id
            ));
          };
        }
      }
        ,
      builder: (BuildContext context, OnSaveCallback onSave) {
        return AddEditScreen(
          key: ArchSampleKeys.editTodoScreen,
          onSave: onSave,
          isEditing: true,
          item: item,
        );
      },
    );
  }
}
