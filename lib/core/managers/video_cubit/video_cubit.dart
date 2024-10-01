// import 'package:bloc/bloc.dart';
// import 'package:khedmety/core/change_state.dart';
// import 'package:video_player/video_player.dart';
//
// class VideoCubit extends Cubit<ChangeState> {
//   VideoPlayerController? videoPlayerController;
//
//   VideoCubit() : super(ChangeState(value: false));
//   init(String url) {
//     print("video is $url");
//     videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url))
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         emit(ChangeState(value: true));
//         print("viiiiiiiiiiiiideo is loaded");
//       });
//   }
// }
