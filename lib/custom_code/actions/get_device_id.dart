// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

Future<String> getDeviceId() async {
  String deviceId = "Unknown device ID";

  var deviceInfo = DeviceInfoPlugin();

  if (Platform.isIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
    // Check if identifierForVendor is not null
    if (iosDeviceInfo.identifierForVendor != null) {
      deviceId = iosDeviceInfo.identifierForVendor!;
      FFAppState().deviceId = deviceId;

      return iosDeviceInfo.identifierForVendor!;
    } else {
      deviceId = "Unknown iOS device ID";
      FFAppState().deviceId = deviceId;

      // Handle case where identifierForVendor is null
      return "Unknown iOS device ID";
    }
  } else if (Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    // Check if id is not null
    if (androidDeviceInfo.id != null) {
      deviceId = androidDeviceInfo.id!;
      FFAppState().deviceId = deviceId;

      return androidDeviceInfo.id!;
    } else {
      // Handle case where id is null
      deviceId = "Unknown Android device ID";
      FFAppState().deviceId = deviceId;

      return "Unknown Android device ID";
    }
  }

  // Handle other platforms if needed
  deviceId = "Unknown device ID";
  FFAppState().deviceId = deviceId;

  return "Unknown device ID";
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
