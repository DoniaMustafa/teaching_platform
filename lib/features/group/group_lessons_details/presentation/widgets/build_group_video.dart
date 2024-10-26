// import 'package:pod_player/pod_player.dart';
import 'package:pod_player/pod_player.dart';
import 'package:teaching/features/group/group_lessons_details/data/models/group_Lesson_details_response_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../../core/export/export.dart';

class BuildGroupVideo extends StatefulWidget {
  const BuildGroupVideo({super.key, required this.model});
  final GroupLessonDetailsDataModel model;
  @override
  State<BuildGroupVideo> createState() => _BuildGroupVideoState();
}

class _BuildGroupVideoState extends State<BuildGroupVideo> {
  late final PodPlayerController controller;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    if (widget.model.introVideoUrl!.contains('youtube').isTrue) {
      String? id = YoutubePlayer.convertUrlToId(widget.model.introVideoUrl!);
      _controller = YoutubePlayerController(
        initialVideoId: id!,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          captionLanguage: "ar",
          // mute: true,
        ),
      );
    } else {
      controller = PodPlayerController(
        playVideoFrom: PlayVideoFrom.network(
            '${EndPoints.url}${widget.model.introVideoUrl!}'),
      )..initialise();
    }

    super.initState();
    // _videoPlayerController = VideoPlayerController.networkUrl(
    //   Uri.parse(
    //     'https://www.youtube.com/watch?v=Cf9dcu5sj1A',
    //   ),
    // )..initialize().then((_) {
    //     setState(
    //         () {}); //here you could use Provider or any other state management approach. I use bloc
    //   });
    // WidgetsBinding.instance.addPostFrameCallback((data) {
    // flickManager = FlickManager(
    //   // autoInitialize: false,
    //   videoPlayerController: VideoPlayerController.networkUrl(
    //     Uri.parse(
    //       'https://www.youtube.com/watch?v=Cf9dcu5sj1A',
    //     ),
    //   ),
    // );
    // });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Container();
    if (widget.model.introVideoUrl!.contains('youtube').isTrue) {
      return YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        // aspectRatio: 105 / 1.9,
      );
    } else {
      return PodVideoPlayer(controller: controller);
    }
  }
}
