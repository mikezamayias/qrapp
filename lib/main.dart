// flutter packages
import 'package:flutter/material.dart';
import 'package:qrapp/remote_widget.dart';
import 'package:workmanager/workmanager.dart';

// custom widgets
import 'qr_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher);
  runApp(const QrApp());
}
