import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_app/auth.dart';
import 'package:my_app/homecontroller.dart';

class MyTeam extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final AuthController authController = Get.find();
  MyTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text('Team Chores'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Welcome Text aligned to the top left

            // Expanded widget centers the remaining content
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Vertically center
                  children: [
                    Obx(() {
                      final selectedDate = homeController.selectedDate.value;
                      return TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'Select Date',
                          hintText: selectedDate == null
                              ? 'No date selected'
                              : "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                          suffixIcon: const Icon(Icons.calendar_today,
                              color: Colors.blue),
                        ),
                        onTap: () => homeController.selectDate(context),
                      );
                    }),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => homeController.submitData(context, "0"),
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
