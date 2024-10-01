import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:teaching/custom_easy_localization.dart';
import 'package:teaching/service_locator.dart';
import 'package:teaching/teaching_app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init;
  // final appDocumentDirectory =
  //     await path_provider.getApplicationDocumentsDirectory();
  // Hive.init(appDocumentDirectory.path);
  // await Hive.openBox('myBox');
  runApp(const CustomEasyLocalization(child: TeachingApp()));
}
