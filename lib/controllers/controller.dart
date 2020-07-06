import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:wallpaper_app/services/keys.dart';

class Controller extends GetxController {
  // Whether to show preview or not
  var showImage = false.obs;

  // show lockscreen preview?
  var lockScreen = false.obs;

  // data from Unsplash API
  var data = List().obs;

  Future<String> getJsonData() async {
    // Intially made null to show progress indicator while data is being fetched
    data.value = null;
    try {
      var response = await http.get(
          'https://api.unsplash.com/photos/random?count=10&client_id=${Keys.UNSPLASH_API_CLIENT_ID}&orientation=portrait');

      var converted = json.decode(response.body);
      data.value = converted;
    } catch (e) {
      print(e.toString());
    }
  }

  saveImage(String imageUrl) async {
    try {
      // Saved with this method.
      var imageId = await ImageDownloader.downloadImage(imageUrl,
          destination: AndroidDestinationType.directoryDownloads);
      if (imageId == null) {
        return;
      }

      // Below is a method of obtaining saved image information.
      var fileName = await ImageDownloader.findName(imageId);
      var path = await ImageDownloader.findPath(imageId);
      var size = await ImageDownloader.findByteSize(imageId);
      var mimeType = await ImageDownloader.findMimeType(imageId);
    } on PlatformException catch (error) {
      print(error);
    }
  }
}
