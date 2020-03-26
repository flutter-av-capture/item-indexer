// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_sample/models/models.dart';
import 'package:redux_sample/presentation/list_screen.dart';
import 'package:redux_sample/presentation/keys.dart';

class ListScreenContainer extends StatelessWidget{
  ListScreenContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OnSaveCallback>(
      distinct: true,
      converter: (Store<AppState> store) {

      },
      builder: (BuildContext context, OnSaveCallback onSave) {
        return ListScreen(
          key: ItemIndexerKeys.itemList,
          onSave: onSave,
          
        );
      },
    );
  }
}