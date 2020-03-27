// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:redux/redux.dart';
import 'package:item_indexer/actions/actions.dart';
import 'package:item_indexer/models/models.dart';
import 'package:item_indexer/selectors/selectors.dart';

final itemsReducer = combineReducers<List<Item>>([
  TypedReducer<List<Item>, AddItemAction>(_addItem)
]);

// [Item 1]
// Action: Item 2
// Return [Item 1, Item 2]
List<Item> _addItem(List<Item> items, AddItemAction action) {
  print("Adding item ${action.item.id} to bin ${action.item.bin}");
  return List.from(items)..add(action.item);
}
