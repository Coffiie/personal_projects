import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_zegocloud_live_call_gh/config.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

///This is the starter project for the Zego cloud live streaming app video.
///Please add your own credentials in lib/config.dart in order for the project to run.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CallPage(
        liveID: 'live_id',
        isHost: Platform.isAndroid,
      ),
    );
  }
}

class CallPage extends StatelessWidget {
  const CallPage({super.key, required this.liveID, required this.isHost});

  final String liveID;
  final bool isHost;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
        appID: Config.appID,
        appSign: Config.appSign,
        userID: Platform.isAndroid ? 'Android' : 'iOS',
        userName: Platform.isAndroid ? 'AndroidUsername' : 'iOSUsername',
        liveID: liveID,
        config: isHost
            ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
            : ZegoUIKitPrebuiltLiveStreamingConfig.audience()
          ..preview.showPreviewForHost = false
          ..bottomMenuBar = ZegoLiveStreamingBottomMenuBarConfig(
            showInRoomMessageButton: false,
            hostButtons: [
              ZegoLiveStreamingMenuBarButtonName.switchCameraButton,
              ZegoLiveStreamingMenuBarButtonName.toggleMicrophoneButton,
            ],
            margin: const EdgeInsets.only(bottom: kToolbarHeight),
          ),
      ),
    );
  }
}
