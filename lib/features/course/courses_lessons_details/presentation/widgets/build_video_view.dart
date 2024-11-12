import 'package:chewie/chewie.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/services.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/lessons_details/vimeo_video_cubit.dart';
import 'package:teaching/features/sessions/session_video_details/presentation/manager/lessons_details/video_of_session_operation_cubit.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../../core/export/export.dart';

class BuildVideoView extends StatelessWidget {
  String? whichScreen;
  BuildVideoView({this.whichScreen});
  @override
  Widget build(BuildContext context) {
    if (whichScreen == AppStrings().course) {
      return _buildIsCourse(whichScreen!);
    } else {
      return _buildIsGroup(whichScreen!);
    }
  }
}

Widget _buildIsCourse(String whichScreen) {
  return BlocBuilder<VideoOperationCubit, CubitStates>(
    builder: (context, state) {
      if (context.read<VideoOperationCubit>().url!.contains('youtube').isTrue) {
        return YoutubeVideo(whichScreen: whichScreen);
      } else if (context
          .read<VideoOperationCubit>()
          .url!
          .contains('mp4')
          .isTrue) {
        return NetWorkVideo(
          whichScreen: whichScreen,
        );
      } else if (context
          .read<VideoOperationCubit>()
          .url!
          .contains('vimeo')
          .isTrue) {
        return BlocBuilder<VimeoVideoCubit, CubitStates>(
          builder: (context, state) {
            if (state is FailedState) {
              return CustomErrorWidget(message: state.message, onTap: () {});
            }
            if (state is LoadedState) {
              return VimeoVideo(
                url: AppService().getBlocData<VideoOperationCubit>().url!,
              );
            }
            return CustomCard(
              width: width,
              radius: 0,
              height: 200.h,
              backgroundColor: AppColors.black,
              child: const Center(
                  child: CircularProgressIndicator(
                color: AppColors.white,
                strokeWidth: 2,
              )),
            );
          },
        );
      } else {
        return const SizedBox.shrink();
      }
    },
  );
}

Widget _buildIsGroup(String whichScreen) {
  return BlocBuilder<VideoOfSessionOperationCubit, CubitStates>(
    builder: (context, state) {
      if (context
          .read<VideoOfSessionOperationCubit>()
          .videoUrl!
          .contains('youtube')
          .isTrue) {
        return YoutubeVideo(whichScreen: whichScreen);
      } else if (context
          .read<VideoOfSessionOperationCubit>()
          .videoUrl!
          .contains('mp4')
          .isTrue) {
        return NetWorkVideo(whichScreen: whichScreen);
      } else if (context
          .read<VideoOfSessionOperationCubit>()
          .videoUrl!
          .contains('vimeo')
          .isTrue) {
        return BlocBuilder<VimeoVideoCubit, CubitStates>(
          builder: (context, state) {
            if (state is FailedState) {
              return CustomErrorWidget(message: state.message, onTap: () {});
            }
            if (state is LoadedState) {
              return VimeoVideo(
                url: state.data.urlLink!,
              );
            }
            return CustomCard(
              width: width,
              radius: 0,
              height: 200.h,
              backgroundColor: AppColors.black,
              child: CircularProgressIndicator(),
            );
          },
        );
      } else {
        return const SizedBox.shrink();
      }
    },
  );
}

class YoutubeVideo extends StatefulWidget {
  String? whichScreen;
  YoutubeVideo({this.whichScreen});
  @override
  State<YoutubeVideo> createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<YoutubeVideo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(
        'whichScreen>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${BuildVideoView().whichScreen}');
    String? id = YoutubePlayer.convertUrlToId(
        widget.whichScreen == AppStrings().course
            ? context.read<VideoOperationCubit>().url!
            : context.read<VideoOfSessionOperationCubit>().videoUrl!);
    _controller = YoutubePlayerController(
      initialVideoId: id!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        captionLanguage: "ar",
        disableDragSeek: true,
        enableCaption: false,
        hideThumbnail: true,
        forceHD: false,
// startAt: 1
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
      onReady: () {},
      bottomActions: [
        ProgressBar(
          isExpanded: true,
          colors: ProgressBarColors(
              backgroundColor: AppColors.black.withOpacity(0.1),
              playedColor: AppColors.red),
        ),
        RemainingDuration(
          controller: _controller,
        ),
      ],
    );
  }
}

class VimeoVideo extends StatefulWidget {
  const VimeoVideo({super.key, required this.url});
  final String url;
  @override
  State<VimeoVideo> createState() => _VimeoVideoState();
}

class _VimeoVideoState extends State<VimeoVideo> {
  late ChewieController chewieController;
  @override
  void initState() {
    super.initState();
    chewieController = ChewieController(
      allowFullScreen: true,
      videoPlayerController:
          VideoPlayerController.networkUrl(Uri.parse(widget.url)),
      autoPlay: false,
      looping: true,
    );
  }

  @override
  void dispose() {
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height * 0.3,
      child: Chewie(
        controller: chewieController,
      ),
    );
  }
}

class NetWorkVideo extends StatefulWidget {
  String? whichScreen;
  NetWorkVideo({this.whichScreen});
  @override
  State<NetWorkVideo> createState() => _NetWorkVideoState();
}

class _NetWorkVideoState extends State<NetWorkVideo> {
  late ChewieController chewieController;
  // late FlickManager flickManager;
  @override
  void initState() {
    super.initState();

    chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(widget
                  .whichScreen ==
              AppStrings().course
          ? "${EndPoints.url}${context.read<VideoOperationCubit>().url}"
          : "${EndPoints.url}${context.read<VideoOfSessionOperationCubit>().videoUrl}")),
      autoPlay: true,
      allowFullScreen: true,
      looping: true,
    );

    // flickManager = FlickManager(
    //     videoPlayerController: VideoPlayerController.networkUrl(
    //   Uri.parse(
    //     widget.whichScreen == AppStrings().course
    //         ? "${EndPoints.url}${context.read<VideoOperationCubit>().url}"
    //         : "${EndPoints.url}${context.read<VideoOfSessionOperationCubit>().videoUrl}",
    //   ),
    // ));
  }

  //
  @override
  void dispose() {
    chewieController.dispose();
    super.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height * 0.3,
      child: Chewie(
        controller: chewieController,
      ),
    );
  }
}
