// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:io';

import 'package:test/test.dart';
import 'package:repository_core/repository_core.dart';
import 'package:repository_local_storage/repository_local_storage.dart';

void main() {
  group('FileStorage', () {
    final todos = [TodoEntity('Task', '1', 'Hallo', false)];
    final directory = Directory.systemTemp.createTemp('__storage_test__');
    final storage = FileStorage(
      '_test_tag_',
      () => directory,
    );

    tearDownAll(() async {
      final tempDirectory = await directory;

      tempDirectory.deleteSync(recursive: true);
    });

    test('Should persist TodoEntities to disk', () async {
      final file = await storage.saveTodos(todos);

      expect(file.existsSync(), isTrue);
    });

    test('Should load TodoEntities from disk', () async {
      final loadedTodos = await storage.loadTodos();

      expect(loadedTodos, todos);
    });
  });
}
