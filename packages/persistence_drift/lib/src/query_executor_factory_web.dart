// ignore_for_file: deprecated_member_use

import 'package:drift/drift.dart';
import 'package:drift/web.dart';

QueryExecutor createQueryExecutor({String? sqliteFilePath}) {
  return WebDatabase('mobile_recipe_lab');
}
