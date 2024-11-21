import 'package:teaching/zego_live/zego_cloud_servec.dart';
import 'package:teaching/core/export/export.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({
    super.key,
  });
  static const String hostKey = "hostKey";
  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  bool isHost = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data = getArguments(context);
    if (data.isNotNull) {
      isHost = data![LiveScreen.hostKey];
    }

    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
        appID: ZegoCloudService()
            .appId, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign: ZegoCloudService()
            .token, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: '${AppPrefs.user!.id ?? 0}',
        userName: AppPrefs.user!.name ?? 'live_ID',
        liveID: 'live_ID',
        config: isHost
            ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
            : ZegoUIKitPrebuiltLiveStreamingConfig.audience(),
      ),
    );
  }
}
