import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth.dart'; // Make sure to import AuthController

class AuthScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final RxBool isLoginMode = true.obs; // Observable for toggling modes

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chores",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isLoginMode.value ? "Welcome Back!" : "Create an Account!",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  isLoginMode.value
                      ? "Sign in to continue"
                      : "Sign up to get started",
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email, color: Colors.blueAccent),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock, color: Colors.blueAccent),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: isLoginMode.value
                      ? () {
                          authController.signIn(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                          authController.email = emailController.text.trim();
                          authController.name =
                              authController.email.split('@')[0];
                        }
                      : null, // Disable when in Sign Up mode
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Sign In", style: TextStyle(fontSize: 16)),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: !isLoginMode.value
                      ? () async {
                          try {
                            bool status = await authController.signUp(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            );
                            if (status) {
                              isLoginMode.value = true;
                            }
                          } catch (e) {
                            // Handle the case where the account already exists
                            Get.snackbar(
                              "Account Already Exists",
                              "This email is already registered. Please sign in.",
                              backgroundColor: Colors.redAccent,
                              colorText: Colors.white,
                            );
                            isLoginMode.value =
                                true; // Switch back to login mode
                          }
                          ;
                        }
                      : null, // Disable when in Login mode
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Sign Up", style: TextStyle(fontSize: 16)),
                ),
                const SizedBox(height: 16),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      isLoginMode.value = !isLoginMode.value; // Toggle mode
                    },
                    child: Text(
                      isLoginMode.value
                          ? "Don't have an account? Sign Up"
                          : "Already have an account? Sign In",
                      style: const TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
