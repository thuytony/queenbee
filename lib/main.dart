import 'package:flutter/material.dart';
import 'package:queenbee/layers/presentation/app_root.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  runApp(const AppRoot());
}