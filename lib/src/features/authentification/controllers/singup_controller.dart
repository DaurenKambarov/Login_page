import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/features/authentification/screens/dashboard.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  BuildContext? _context; // Store the context

  // Method to set the context
  void setContext(BuildContext context) {
    _context = context;
  }

  Future<void> registerUser(String email, String password) async {
    if (_context == null) {
      print("Context is null. Cannot navigate.");
      return;
    }

    try {
      // Create user in Firebase
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Check if user registration was successful
      if (userCredential.user != null) {
        // Navigate to the dashboard after successful registration
        Navigator.pushReplacement(
          _context!,
          MaterialPageRoute(builder: (context) => const Dashboard()),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Handle Firebase-specific errors
      ScaffoldMessenger.of(_context!).showSnackBar(
        SnackBar(
          content: Text(e.message ?? "Registration failed"),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      // Handle other errors
      ScaffoldMessenger.of(_context!).showSnackBar(
        const SnackBar(
          content: Text("Something went wrong. Please try again."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
  

  Future<void> loginUser(String email, String password) async {
    if (_context == null) {
      print("Context is null. Cannot navigate.");
      return;
    }

    try {
      // Sign in with Firebase
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Check if login was successful
      if (userCredential.user != null) {
        // Navigate to the dashboard after successful login
        Navigator.pushReplacement(
          _context!,
          MaterialPageRoute(builder: (context) => const Dashboard()),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Handle Firebase-specific errors
      ScaffoldMessenger.of(_context!).showSnackBar(
        SnackBar(
          content: Text(e.message ?? "Login failed"),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      // Handle other errors
      ScaffoldMessenger.of(_context!).showSnackBar(
        const SnackBar(
          content: Text("Something went wrong. Please try again."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
