import 'dart:io';

import 'package:genio_isolate_manager_generator/genio_isolate_manager_generator.dart';
import 'package:test/test.dart';

void main() {
  group('Main test', () {
    test('listDartFiles', () {
      final files = <File>[];
      final dartFiles = GenioIsolateManagerGenerator.listDartFiles(
        Directory('test'),
        files,
      );

      expect(dartFiles.length, greaterThan(1));
    });

    test('resolveDartArgs prepends pubspec args before CLI args', () {
      final result = GenioIsolateManagerGenerator.resolveDartArgs(
        {
          'dart-args': ['--no-source-maps', '--enable-asserts'],
        },
        ['--enable-asserts'],
      );

      expect(
        result,
        equals(['--no-source-maps', '--enable-asserts', '--enable-asserts']),
      );
    });

    test('resolveDartArgs falls back to pubspec config', () {
      final result = GenioIsolateManagerGenerator.resolveDartArgs(
        {
          'dart-args': ['--no-source-maps'],
        },
        [],
      );

      expect(result, equals(['--no-source-maps']));
    });
  });
}
