import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:teaching/core/export/export.dart';

class FileManagerCubit extends Cubit<CubitStates> {
  FileManagerCubit() : super(InitialState());
  String? fileName;
  File? file;
  Future getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );
    file = File(result!.files.single.path!);
    fileName = file!.path.split('/').last;
    // return file;
    emit(LoadedState<dynamic>(data: file));
  }

  File? image;
  Future getImage({bool isCamera = false}) async {
    image = await getCameraImage(isCamera: isCamera);
    print('image>>>>>>>>>>>>>>${image!.path}');
    emit(LoadedState<dynamic>(data: image));
  }

  File? video;
  Future getVideo() async {
    video = await getGalleryVideo();
    print('video>>>>>>>>>>>>>>${video!.path}');
    emit(LoadedState<dynamic>(data: video));
  }
}
