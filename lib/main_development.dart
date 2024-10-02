import 'package:flutter/cupertino.dart';
import 'package:royal/app/app.dart';
import 'package:royal/bootstrap.dart';
import 'package:royal/utils/hive_config/hive_config.dart';
import 'core/di/di.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final hiveConfig = HiveConfig();
  await hiveConfig.init();
  await di.init(hiveConfig);
  await bootstrap(() => const App());
}
