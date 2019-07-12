import 'package:MovieDirect/app.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  Crashlytics.instance.enableInDevMode = true;
  runApp(MyApp());
}
