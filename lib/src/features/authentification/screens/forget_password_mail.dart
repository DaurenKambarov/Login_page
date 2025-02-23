// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/constants/sizes.dart';
import 'package:flutter_application_1/src/features/authentification/screens/otp_screen.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: tDefaultSize * 2),
      
              const Image(
                image: AssetImage("assets/images/forgot_password.png"),
                width: 150,
              ),

              const SizedBox(height: tDefaultSize * 2),

              Text(
                "Forgot Password",
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              Text(
                "Enter your email to get verification SMS",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: tDefaultSize * 2),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      labelText: "E-mail",
                      hintText: "E-mail",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  
                  const SizedBox(height: tDefaultSize),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OTPScreen()),
                );
                      },
                      child: Text(
                        "next".toUpperCase(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: isDarkMode ? Colors.white : Colors.white,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
