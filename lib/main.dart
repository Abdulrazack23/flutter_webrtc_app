import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_webrtc_app/joinscreen.dart';
import 'package:flutter_webrtc_app/socketsever.dart';

void main() {
  // start videoCall app
  runApp(VideoCallApp());
}

class VideoCallApp extends StatelessWidget {
  VideoCallApp({super.key});

  final String websocketUrl = "WEB_SOCKET_SERVER_URL";

  final String selfCallerID =
      Random().nextInt(999999).toString().padLeft(6, '0');

  @override
  Widget build(BuildContext context) {
    SignallingService.instance.init(
      websocketUrl: websocketUrl,
      selfCallerID: selfCallerID,
    );

    // return material app
    return MaterialApp(
      darkTheme: ThemeData.light().copyWith(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(),
      ),
      themeMode: ThemeMode.dark,
      home: JoinScreen(selfCallerId: selfCallerID),
    );
  }
}
