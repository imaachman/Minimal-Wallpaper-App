import 'package:test/test.dart' as tst;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallpaper_app/controllers/controller.dart';

void main() {
  tst.group('Controller', () {
    test('data should not be null after getJsonData()', () {
      final _controller = Controller();

      _controller.getJsonData();

      tst.expect(_controller.data, tst.isNotNull);
    });
  });
}
