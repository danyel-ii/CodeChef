import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';

QueryExecutor createQueryExecutor({String? sqliteFilePath}) {
  if (sqliteFilePath == null || sqliteFilePath.isEmpty) {
    return NativeDatabase.memory();
  }
  return NativeDatabase(File(sqliteFilePath));
}
