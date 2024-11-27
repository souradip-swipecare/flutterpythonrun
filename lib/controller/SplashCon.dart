import 'dart:async';

import 'package:fpythnasiignmnt/Screen/HomeScreen.dart';
import 'package:get/get.dart';

class Splashcon extends GetxController{
  @override
  Future<void> onInit()  async {
     Timer(
      const Duration(seconds: 3),
      () => Get.offAll(
        const Homescreen(),
      ),
    );
    super.onInit();
  }

}