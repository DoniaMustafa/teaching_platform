import 'package:pod_player/pod_player.dart';
import 'package:teaching/features/course/courses_lessons_details/data/models/course_Lesson_details_response_model.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/lessons_details/video_operation_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../core/export/export.dart';

//     "${EndPoints.url}${context.read<VideoOperationCubit>().url}")

// "https://player.vimeo.com/progressive_redirect/playback/1019614327/rendition/360p/file.mp4?loc=external&signature=81595ca3a76d59465fe74a097f2229811ddd5ac7b75652741d6413c9f83b3775"),

// context
//     .read<VideoOperationCubit>()
//     .url!
//     .contains('youtube')
//     .isTrue
// ?        // "https://player.vimeo.com/progressive_redirect/playback/1019614327/rendition/360p/file.mp4?loc=external&signature=81595ca3a76d59465fe74a097f2229811ddd5ac7b75652741d6413c9f83b3775"
class BuildCourseVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoOperationCubit, CubitStates>(
      builder: (context, state) {
        // if (context.read<VideoOperationCubit>().url!.contains('vimeo').isTrue) {
        // return AspectRatio(
        //   // height: 300,
        //   aspectRatio: 2.0 / 1.1,
        //   child: WebViewWidget(
        //     controller: _webViewController,
        //   ),
        // );
        // } else
        if (context
            .read<VideoOperationCubit>()
            .url!
            .contains('youtube')
            .isTrue) {
          return YoutubeVideo();
        } else if (context
            .read<VideoOperationCubit>()
            .url!
            .contains('mp4')
            .isTrue) {
          return NetWorkVideo();
        } else if (context
            .read<VideoOperationCubit>()
            .url!
            .contains('vimeo')
            .isTrue) {
          return VimeoVideo();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class YoutubeVideo extends StatefulWidget {
  const YoutubeVideo({super.key});

  @override
  State<YoutubeVideo> createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<YoutubeVideo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    String? id =
        YoutubePlayer.convertUrlToId(context.read<VideoOperationCubit>().url!);
    _controller = YoutubePlayerController(
      initialVideoId: id!,
      flags: const YoutubePlayerFlags(
          autoPlay: false,
          captionLanguage: "ar",
          disableDragSeek: true,
          enableCaption: true,
          hideThumbnail: true,
          forceHD: false
          // mute: true,
          ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      onReady: () {
        _controller.addListener(() {
          print(_controller.flags.disableDragSeek);
          setState(() {});
        });
      },
      // aspectRatio: 105 / 1.9,
    );
  }
}

class VimeoVideo extends StatefulWidget {
  const VimeoVideo({super.key});

  @override
  State<VimeoVideo> createState() => _VimeoVideoState();
}

class _VimeoVideoState extends State<VimeoVideo> {
  late PodPlayerController _podController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _podController = PodPlayerController(
        playVideoFrom: PlayVideoFrom.network(
      "https://player.vimeo.com/progressive_redirect/playback/1019614327/rendition/360p/file.mp4?loc=external&signature=81595ca3a76d59465fe74a097f2229811ddd5ac7b75652741d6413c9f83b3775",
    ))
      ..initialise();
  }

  @override
  void dispose() {
    _podController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PodVideoPlayer(
      controller: _podController,
      alwaysShowProgressBar: true,
    );
  }
}

class NetWorkVideo extends StatefulWidget {
  const NetWorkVideo({super.key});

  @override
  State<NetWorkVideo> createState() => _NetWorkVideoState();
}

class _NetWorkVideoState extends State<NetWorkVideo> {
  late PodPlayerController _podController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _podController = PodPlayerController(
        playVideoFrom: PlayVideoFrom.network(
      "${EndPoints.url}${context.read<VideoOperationCubit>().url}",
    ))
      ..initialise();
  }

  @override
  void dispose() {
    _podController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PodVideoPlayer(
      controller: _podController,
      alwaysShowProgressBar: true,
    );
  }
}
//
//   late PodPlayerController podController;
//   // late YoutubePlayerController _controller ;
//   @override
//   void initState() {
//     super.initState();
//
//     // _controller = YoutubePlayerController(
//     //   initialVideoId: '44K7M1oCst8',
//     //   flags: YoutubePlayerFlags(
//     //     autoPlay: true,
//     //     mute: true,
//     //   ),
//     // );
//     // final url = context.read<VideoOperationCubit>().url;
//     // print('url>>>>>>>>>> ${context.read<VideoOperationCubit>().url}');
//     // // if (url != null && !url.contains('vimeo')) {
//     podController = PodPlayerController(
//       playVideoFrom:
//           PlayVideoFrom.youtube("https://www.youtube.com/watch?v=44K7M1oCst8"),
//     )..initialise();
//     // }
//     // podController = PodPlayerController(
//     //   playVideoFrom:
//     //
//     //       PlayVideoFrom.youtube(
//     //     'https://www.youtube.com/watch?v=44K7M1oCst8',
//     //   ),
//     //
//     // );
//     // try {
//     //   podController.initialise();
//     // } catch (error) {
//     //   print('Error initializing podController: $error');
//     //   // Play video with default quality (if supported):
//     //   podController.play(quality: VideoQuality.LOW); // Or MEDIUM, HIGH
//     //   // Alternatively, display an error message or retry initialization.
//     // }
//     // ..initialise();
//   }
//
//   // final controller = WebViewController()
//   //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
//   //   ..loadRequest(
//   //       Uri.parse('https://player.vimeo.com/video/1019590573?h=9f5d431aff'));
//
//   @override
//   void dispose() {
//     podController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<VideoOperationCubit, CubitStates>(
//       builder: (context, state) {
//         // if (context.read<VideoOperationCubit>().url!.contains('vimeo').isTrue) {
//         //   return AspectRatio(
//         //     aspectRatio: 2.0 / 1.1,
//         //     child: WebViewWidget(
//         //       controller: controller,
//         //     ),
//         //   );
//         // } else {
//         // print('podController>>>>>>>>>> ${podController.videoUrl}');
//         return PodVideoPlayer(
//           controller: podController,
//           alwaysShowProgressBar: true,
//         );
//         // }
//         // return YoutubePlayer(
//         //   controller: _controller,
//         //   showVideoProgressIndicator: true,
//         // progressIndicatorColor: Colors.amber,
//         // progressColors: const ProgressBarColors(
//         //   playedColor: Colors.amber,
//         //   handleColor: Colors.amberAccent,
//         // ),
//         // onReady: () {
//         //   _controller.addListener(listener);
//         // },
//         // );
//       },
//     );
//   }
// }
