// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart'; // Keep for notification permissions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future notificationPermission() async {
  // Request notification permissions without Firebase
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  print('Notification permission request handled.');
}
