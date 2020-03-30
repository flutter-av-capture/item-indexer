// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/widgets.dart';

class ItemIndexerKeys {
  // Home Screens
  static const homeScreen = Key('__homeScreen__');
  static const addItemFab = Key('__addItemFab__');
  static const snackbar = Key('__snackbar__');
  static Key snackbarAction(String id) => Key('__snackbar_action_${id}__');

  // Items
  static const itemList = Key('__itemList__');
  static const itemsLoading = Key('__todosLoading__');
  static final item = (String id) => Key('item__${id}');
  static final itemCheckOut =
      (String id) => Key('item__${id}__Checkout');
  static final itemId = (String id) => Key('item__${id}__Id');
  static final itemBin = (String id) => Key('item__${id}__Bin');

  // Tabs
  static const tabs = Key('__tabs__');
  static const itemTab = Key('__itemTab__');
  static const listTab = Key('__statsTab__');

  // List
  static const listLoading = Key('__statsLoading__');

  // Add Screen
  static const addItemScreen = Key('__addItemScreen__');
  static const saveNewItem = Key('__saveNewItem__');
  static const idField = Key('__idField__');
  static const binField = Key('__binField__');

  // Edit Screen
  static const editItemScreen = Key('__editItemScreen__');
  static const saveItemFab = Key('__saveItemFab__');
}
