// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:key_value_store_flutter/key_value_store_flutter.dart';
import 'package:redux/redux.dart';
import 'package:item_indexer/app.dart';
import 'package:item_indexer/reducers/app_state_reducer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:repository_local_storage/repository_local_storage.dart';

import 'middleware/store_todos_middleware.dart';
import 'models/app_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ReduxApp(
    store: Store<AppState>(
      appReducer,
      initialState: AppState.loading(),
      middleware: [
        ...createStoreTodosMiddleware(
          LocalStorageRepository(
            localStorage: KeyValueStorage(
              'redux',
              FlutterKeyValueStore(await SharedPreferences.getInstance()),
            )
          )
        ),
      ]
    ),
  ));
}
