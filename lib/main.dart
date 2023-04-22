import 'package:flutter/material.dart';

import 'MyApp.dart';
import 'dart:io';
import 'MyApp.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'repository/box_repository.dart';
import 'models/Event.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(EventAdapter());
  await BoxRepository.openBox();
  runApp(const MyApp());
}
