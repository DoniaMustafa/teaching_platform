import 'package:teaching/core/export/export.dart';
import 'package:url_launcher/url_launcher.dart';

class AttachmentsOperationCubit extends Cubit<CubitStates> {
  AttachmentsOperationCubit() : super(InitialState());

  Future<void> launchURL(String url) async {
    String pathUrl = url;

    if (await canLaunchUrl(Uri.parse(url))) {
      Uri uri = Uri.parse(pathUrl);
      print(url);
      await launchUrl(uri, mode: LaunchMode.inAppWebView);
    } else {
      throw 'Could not launch $url';
    }
    // emit(LoadedState<dynamic>(data: pathUrl));
  }

}
