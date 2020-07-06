import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/controllers/controller.dart';

// Display Lockscreen Preview or Homescreen Preview

class OverlayImages extends StatelessWidget {
  final Controller _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => _controller.showImage.value
        ? Container(
            width: MediaQuery.of(context).size.width,
            child: Image(
              image: AssetImage(_controller.lockScreen.value
                  ? "assets/images/lockscreen.png"
                  : "assets/images/homescreen.png"),
              fit: BoxFit.fitWidth,
            ),
          )
        : Container());
  }
}
