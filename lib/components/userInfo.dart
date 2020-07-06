import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/controllers/controller.dart';

// Basic widget to show the uploader of the image

class UserInfo extends StatelessWidget {
  UserInfo({this.index});

  int index;

  final Controller _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => !_controller.showImage.value
        ? Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 70.0,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 4.0, left: 5.0),
                    height: 25.0,
                    width: MediaQuery.of(context).size.width / 2,
                    color: Colors.black87,
                    child: Text(
                      "Photo by",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 7.0, left: 5.0),
                    width: MediaQuery.of(context).size.width / 2,
                    height: 40.0,
                    color: Colors.black87,
                    child: Text(
                      _controller.data[index]['user']['name'],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          )
        : Container());
  }
}
