import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
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
  Future getImage({bool isCamera = false, bool isProfile = false}) async {
    image = await getCameraImage(isCamera: isCamera);

    if (image.isNotNull) {
      if (isProfile.isTrue) {
        AppService()
            .getBlocData<UserCubit>()
            .changeUserImage(image: image!.path);
        print('image>>>>>>>>>>>>>>${image!.path}');
      }
      print('image>>>>>>>>>>>>>>${image!.path}');
      emit(LoadingState());
    }
  }
  // Future getImage({bool isCamera = true, bool isProfile = false}) async {
  //   final pickedImage = await ImagePicker().pickImage(
  //       imageQuality: 60,
  //       source: isCamera ? ImageSource.camera : ImageSource.gallery);
  //   if (pickedImage.isNotNull) {
  //     image = pickedImage!.path;
  //     if (isProfile.isTrue) {
  //       AppService().getBlocData<UserCubit>().changeUserImage(image: image!);
  //     }
  //
  //     print('image>>>>>>>>>>>>>>${image!}');
  //   }
  //
  // }

  File? video;
  Future getVideo() async {
    video = await getGalleryVideo();
    print('video>>>>>>>>>>>>>>${video!.path}');
    emit(LoadedState<dynamic>(data: video));
  }
}
