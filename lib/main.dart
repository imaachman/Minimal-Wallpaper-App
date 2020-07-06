import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/pages/homePage.dart';

void main() {
  runApp(WallpaperApp());
}

// GetMaterialApp used instead of MaterialApp for managing state and routes

class WallpaperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}
