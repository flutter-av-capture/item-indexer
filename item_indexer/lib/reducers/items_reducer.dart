// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:redux/redux.dart';
import 'package:redux_sample/actions/actions.dart';
import 'package:redux_sample/models/models.dart';
import 'package:redux_sample/selectors/selectors.dart';

final itemsReducer = combineReducers<List<Item>>([
  TypedReducer<List<Item>, AddItemAction>(_addItem)
]);

List<Item> _addItem(List<Item> items, AddItemAction action) {
  print(action);
  print(items);
  return List.from(items)..add(action.item);
}
