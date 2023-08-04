import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'my_app.dart';
SharedPreferences? globalSharedPrefs;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
globalSharedPrefs=await SharedPreferences.getInstance();
  runApp(const MyApp());
}

