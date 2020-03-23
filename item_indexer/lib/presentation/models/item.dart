// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

// import 'package:app_core/app_core.dart';
import 'package:meta/meta.dart';
// import 'package:repository_core/repository_core.dart';

@immutable
class Item {
  final bool checkedOut;
  final String id;
  final int bin;

  Item({this.checkedOut = false, int bin, String id})
      : bin = bin ?? 0,
        id = id ?? Uuid().generateV4();

  Item copyWith({bool checkedOut, String id, int bin}) {
    return Item(
      bin ?? this.bin,
      checkedOut: checkedOut ?? this.checkedOut,
      id: id ?? this.id,
    );
  }

  @override
  int get hashCode =>
      checkedOut.hashCode ^ id.hashCode ^ bin.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Item &&
          runtimeType == other.runtimeType &&
          complete == other.complete &&
          task == other.task &&
          note == other.note &&
          id == other.id;

  @override
  String toString() {
    return 'Item{complete: $complete, task: $task, note: $note, id: $id}';
  }

  ItemEntity toEntity() {
    return ItemEntity(task, id, note, complete);
  }

  static Item fromEntity(ItemEntity entity) {
    return Item(
      entity.task,
      complete: entity.complete ?? false,
      note: entity.note,
      id: entity.id ?? Uuid().generateV4(),
    );
  }
}
