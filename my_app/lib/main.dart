import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/homecontroller.dart';
import 'Tablescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.blue[50],
          labelStyle: const TextStyle(color: Colors.blue),
          hintStyle: const TextStyle(color: Colors.grey),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            textStyle: const TextStyle(fontSize: 16),
            backgroundColor: const Color.fromARGB(255, 76, 168, 243),
          ),
        ),
      ),
      home: MyHomePage(),
      routes: {
        '/table': (context) => TablePage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Picker and Text Field'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                  suffixIcon:
                      const Icon(Icons.calendar_today, color: Colors.blue),
                ),
                onTap: () => homeController.selectDate(context),
              );
            }),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => homeController.submitData(context),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
