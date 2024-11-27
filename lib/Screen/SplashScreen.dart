import 'package:flutter/material.dart';
import 'package:fpythnasiignmnt/controller/SplashCon.dart';
import 'package:fpythnasiignmnt/utils/utils.dart';
import 'package:get/get.dart';

class Splashscreen extends StatelessWidget {
   Splashscreen({super.key});
  final Splashcon sq = Get.put(Splashcon());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 100, 
              height: 100, 
            ),
            const SizedBox(height: 20,),
            const Text(
              Utils.appname,
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Courier New',
                fontWeight: FontWeight.w800,
                color: Colors.lightBlue
              ),
            )
          ],
        ),
      ),
    );
  }
}