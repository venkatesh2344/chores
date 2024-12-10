import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/main.dart';

class AuthController extends GetxController {
  var isAuthenticated = false.obs; // This will hold authentication state

  // Initialize Firebase Auth instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Sign Up Method
  Future<void> signUp(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      isAuthenticated.value = true; // Update the authentication state
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Sign In Method
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      isAuthenticated.value = true;
      Get.to(MyHomePage());
      print("working");
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Sign Out Method
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      isAuthenticated.value = false; // Update the authentication state
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}
