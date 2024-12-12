import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_app/auth.dart';
import 'package:my_app/gymcontroller.dart';
import 'package:my_app/homecontroller.dart';
import 'package:my_app/roomcontroller.dart';

class MyRoomPage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final Roomcontroller authController = Get.find();
  MyRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text("Gym"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Welcome Text aligned to the top left
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Welcome your work is ${authController.mygymwork}",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
