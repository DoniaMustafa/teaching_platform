import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:path/path.dart' as path;
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AttachmentsOperationCubit extends Cubit<CubitStates> {
  AttachmentsOperationCubit() : super(InitialState());

  launchURL(String url) async {
    String pathUrl = url;

    if (await canLaunchUrlString(url)) {
      Uri uri = Uri.parse(pathUrl);
      print(url);
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
    emit(LoadedState<dynamic>(data: pathUrl));
  }
}
