// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:item_indexer/models/models.dart';

class ClearCompletedAction {}

class ToggleAllAction {}

class LoadTodosAction {}

class TodosNotLoadedAction {}

class TodosLoadedAction {
  final List<Todo> todos;

  TodosLoadedAction(this.todos);

  @override
  String toString() {
    return 'TodosLoadedAction{todos: $todos}';
  }
}

class UpdateTodoAction {
  final String id;
  final Todo updatedTodo;

  UpdateTodoAction(this.id, this.updatedTodo);

  @override
  String toString() {
    return 'UpdateTodoAction{id: $id, updatedTodo: $updatedTodo}';
  }
}

class DeleteTodoAction {
  final String id;

  DeleteTodoAction(this.id);

  @override
  String toString() {
    return 'DeleteTodoAction{id: $id}';
  }
}

class AddTodoAction {
  final Todo todo;

  AddTodoAction(this.todo);

  @override
  String toString() {
    return 'AddTodoAction{todo: $todo}';
  }
}

class UpdateFilterAction {
  final VisibilityFilter newFilter;

  UpdateFilterAction(this.newFilter);

  @override
  String toString() {
    return 'UpdateFilterAction{newFilter: $newFilter}';
  }
}

class UpdateTabAction {
  final AppTab newTab;

  UpdateTabAction(this.newTab);

  @override
  String toString() {
    return 'UpdateTabAction{newTab: $newTab}';
  }
}

class AddItemAction {
  final Item item;

  AddItemAction(this.item);

  @override
  String toString() {
    return 'AddItemAction{Item: $item}';
  }
}

class CheckoutItemAction {
  final Item item;

  CheckoutItemAction(this.item);

  @override
  String toString() {
    return 'CheckoutItemAction{Item: $item}';
  }
}

class CheckinItemAction {
  final Item item;

  CheckinItemAction(this.item);

  @override
  String toString() {
    return 'CheckinItemAction{Item: $item}';
  }
}