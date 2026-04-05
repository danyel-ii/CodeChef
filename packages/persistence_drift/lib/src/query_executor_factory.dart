import 'package:drift/drift.dart';

import 'query_executor_factory_native.dart'
    if (dart.library.js_interop) 'query_executor_factory_web.dart';

QueryExecutor createRecipeQueryExecutor({String? sqliteFilePath}) {
  return createQueryExecutor(sqliteFilePath: sqliteFilePath);
}
