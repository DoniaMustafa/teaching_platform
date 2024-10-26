import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:teaching/custom_easy_localization.dart';
import 'package:teaching/global_bloc_observer.dart';
import 'package:teaching/local_notification.dart';
import 'package:teaching/teaching_app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'core/export/export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator().init;
  Bloc.observer = GlobalBlocObserver();
  await EasyLocalization.ensureInitialized();
  await NotificationsService().initialize();
  runApp(const CustomEasyLocalization(child: TeachingApp()));
}
