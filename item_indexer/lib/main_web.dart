// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:key_value_store_web/key_value_store_web.dart';
import 'package:redux/redux.dart';
import 'package:item_indexer/app.dart';
import 'package:item_indexer/middleware/store_todos_middleware.dart';
import 'package:item_indexer/models/app_state.dart';
import 'package:item_indexer/reducers/app_state_reducer.dart';
import 'package:repository_local_storage/repository_local_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ReduxApp(
    store: Store<AppState>(
      appReducer,
      initialState: AppState.loading(),
      middleware: createStoreTodosMiddleware(LocalStorageRepository(
        localStorage: KeyValueStorage(
          'redux',
          WebKeyValueStore(window.localStorage),
        ),
      )),
    ),
  ));
}
