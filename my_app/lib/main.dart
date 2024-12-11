import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/AuthScreen.dart';
import 'package:my_app/auth.dart';
import 'package:my_app/homecontroller.dart';
import 'Tablescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController()); // Initialize your GetX controller here

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
      home: AuthScreen(),
      routes: {
        '/table': (context) => TablePage(),
      },
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   final HomeController homeController = Get.put(HomeController());
//   final AuthController authController = Get.find();
//   MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: const Text('Date Picker and Text Field'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             // Welcome Text aligned to the top left
//             Align(
//               alignment: Alignment.topCenter,
//               child: Text(
//                 "Welcome ${authController.email.split('@')[0]}",
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blueAccent,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),

//             // Expanded widget centers the remaining content
//             Expanded(
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment:
//                       MainAxisAlignment.center, // Vertically center
//                   children: [
//                     Obx(() {
//                       final selectedDate = homeController.selectedDate.value;
//                       return TextField(
//                         readOnly: true,
//                         decoration: InputDecoration(
//                           labelText: 'Select Date',
//                           hintText: selectedDate == null
//                               ? 'No date selected'
//                               : "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
//                           suffixIcon: const Icon(Icons.calendar_today,
//                               color: Colors.blue),
//                         ),
//                         onTap: () => homeController.selectDate(context),
//                       );
//                     }),
//                     const SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () => homeController.submitData(context),
//                       child: const Text('Submit'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
