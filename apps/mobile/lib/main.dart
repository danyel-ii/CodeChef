import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_recipe_lab_mobile/src/app/mobile_recipe_lab_app.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
  runApp(const ProviderScope(child: MobileRecipeLabApp()));
}
