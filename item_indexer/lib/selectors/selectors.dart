// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:app_core/app_core.dart';
import 'package:item_indexer/models/models.dart';

List<Todo> todosSelector(AppState state) => state.todos;
List<Item> itemsSelector(AppState state) => state.items;

VisibilityFilter activeFilterSelector(AppState state) => state.activeFilter;

AppTab activeTabSelector(AppState state) => state.activeTab;

bool isLoadingSelector(AppState state) => state.isLoading;

bool allCompleteSelector(List<Todo> todos) =>
    todos.every((todo) => todo.complete);

int numActiveSelector(List<Todo> todos) =>
    todos.fold(0, (sum, todo) => !todo.complete ? ++sum : sum);

int numCompletedSelector(List<Todo> todos) =>
    todos.fold(0, (sum, todo) => todo.complete ? ++sum : sum);

List<Todo> filteredTodosSelector(
  List<Todo> todos,
  VisibilityFilter activeFilter,
) {
  return todos.where((todo) {
    switch (activeFilter) {
      case VisibilityFilter.active:
        return !todo.complete;
      case VisibilityFilter.completed:
        return todo.complete;
      case VisibilityFilter.all:
      default:
        return true;
    }
  }).toList();
}

Optional<Todo> todoSelector(List<Todo> todos, String id) {
  try {
    return Optional.of(todos.firstWhere((todo) => todo.id == id));
  } catch (e) {
    return Optional.absent();
  }
}


Optional<Item> itemSelector(List<Item> items, String id) {
  try {
    return Optional.of(items.firstWhere((item) => item.id == id));
  } catch (e) {
    return Optional.absent();
  }
}