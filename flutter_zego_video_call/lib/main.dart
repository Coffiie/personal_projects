import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: TextButton(
        child: const Text('Join Call'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CallPage(callID: 'callId'),
            ),
          );
        },
      ),
    ));
  }
}

class CallPage extends StatelessWidget {
  const CallPage({super.key, required this.callID});
  final String callID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZegoUIKitPrebuiltCall(
        appID: 1786311803,
        appSign:
            '4642a05f5e8803b439a2aee6d2e7cf8cb1444cb94d18f57f5f9045abb89057ec',
        callID: callID,
        userID: '1213${Platform.operatingSystem}',
        userName: 'Rawaha${Platform.operatingSystem}',
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
          ..hangUpConfirmDialog.info = ZegoCallHangUpConfirmDialogInfo()
          ..topMenuBar = ZegoCallTopMenuBarConfig(
            title: 'Rawaha${Platform.operatingSystem}',
            hideAutomatically: false,
            hideByClick: false,
          )
          ..bottomMenuBar = ZegoCallBottomMenuBarConfig(
            margin: const EdgeInsets.all(32),
            hideAutomatically: false,
            hideByClick: false,
          )
          ..layout = ZegoLayout.gallery(),
      ),
    );
  }
}
