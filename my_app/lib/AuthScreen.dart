import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'auth.dart'; // Make sure to import AuthController

class AuthScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthController authController =
        Get.find(); // Get instance of AuthController

    return Scaffold(
      appBar: AppBar(title: Text("Firebase Authentication")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                authController.signUp(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );
              },
              child: Text("Sign Up"),
            ),
            ElevatedButton(
              onPressed: () {
                authController.signIn(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );
              },
              child: Text("Sign In"),
            ),
            ElevatedButton(
              onPressed: () {
                authController.signOut();
              },
              child: Text("Sign Out"),
            ),
          ],
        ),
      ),
    );
  }
}
