import 'package:flutter/material.dart';
import 'package:flutter_project/Core/di/dependency_injection.dart';
import 'package:flutter_project/myApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  runApp(const MyApp());
}

