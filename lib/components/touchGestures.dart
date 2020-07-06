import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/controllers/controller.dart';

// A layer of Gesture Detector on top of image with double tap and hold gestures

class TouchGestures extends StatelessWidget {
  TouchGestures({this.index});

  int index;

  final Controller _controller = Get.find();

  Widget touchGesture(bool pressed, bool isLockscreen) {
    return Obx(() {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onDoubleTap: () {
          // Show dialog box on double tap
          Get.dialog(AlertDialog(
            title: Text(
              "Saved!",
              style: TextStyle(fontSize: 24.0),
            ),
            content: Text(
              "Wallpaper saved to downloads folder!",
              style: TextStyle(fontSize: 18.0),
            ),
            actions: [
              FlatButton(
                onPressed: () => Get.back(),
                child: Text("High 5!", style: TextStyle(fontSize: 18.0)),
              )
            ],
          ));

          // call saveImage function from Controller
          _controller.saveImage(_controller.data[index]['links']['download']);
        },
        onLongPress: () {
          // Switch between lockscreen and homescreen based on lockscreen.value
          _controller.showImage.value = pressed;
          _controller.lockScreen.value = isLockscreen;
        },
        onLongPressEnd: (details) {
          // As the tap is released, don't show previews
          _controller.showImage.value = false;
        },
        child: Container(
          height: Get.height,
          width: Get.width / 3,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Row(
        children: [
          touchGesture(true, true),
          touchGesture(false, false),
          touchGesture(true, false)
        ],
      ),
    );
  }
}
