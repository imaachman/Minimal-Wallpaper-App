import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shake/shake.dart';
import 'package:wallpaper_app/components/overlayImages.dart';
import 'package:wallpaper_app/components/touchGestures.dart';
import 'package:wallpaper_app/components/unsplashImages.dart';
import 'package:wallpaper_app/components/userInfo.dart';
import 'package:wallpaper_app/controllers/controller.dart';

// Place the components to create HomePage

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Controller _controller = Get.put(Controller());

  @override
  void initState() {
    super.initState();
    _controller.getJsonData();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      // Do stuff on phone shake
      _controller.getJsonData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.black,
        body: _controller.data.value == null
            ? Center(
                child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ))
            : PageView.builder(
                itemCount: _controller.data.value.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      UnsplashImages(
                        index: index,
                      ),
                      OverlayImages(),
                      TouchGestures(
                        index: index,
                      ),
                      UserInfo(
                        index: index,
                      ),
                    ],
                  );
                },
              ),
      );
    });
  }
}
