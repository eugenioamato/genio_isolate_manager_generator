import 'dart:io';

import 'package:genio_isolate_manager_generator/genio_isolate_manager_generator.dart';

void main(List<String> args) async {
  final exitCode = await GenioIsolateManagerGenerator.execute(args);

  exit(exitCode);
}
