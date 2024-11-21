// import 'dart:convert';
// import 'package:flutter/services.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:teaching/agora/cubit/agora_cubit.dart';
//
// import '../core/export/export.dart';
//
class ZegoCloudService {
  static ZegoCloudService instance = ZegoCloudService._internal(); // named constructor

  /// Private constructor
  ZegoCloudService._internal();
  factory ZegoCloudService() => instance;
    int appId = 1204231548;
  String channelName = "teaching";
  bool localUserJoined = false;
  bool remoteUserJoined = false;
  String token =
      "c3893f3c8e8c3a18718cac65eead09a0fa5adf3e038f053afa370b20b9320be7";


}
