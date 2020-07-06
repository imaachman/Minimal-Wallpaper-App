import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/controllers/controller.dart';

// Images from API to be placed at the bottom of the stack

class UnsplashImages extends StatelessWidget {
  UnsplashImages({this.index});

  int index;

  final Controller _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Image(
        image: NetworkImage(_controller.data[index]['urls']['regular']),
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null)
            return child;

          // Wlile image is not loaded, show progress indicator
          else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes
                    : null,
              ),
            );
          }
        },
      ),
    );
  }
}
