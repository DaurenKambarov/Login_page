import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/constants/sizes.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override 
  Widget build(BuildContext context){

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("CODE", style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 80.0
            ),),
            Text("VERIFICATION", style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: 40,),
            Text("Enter the verification code sent at" + "someEmail@org.com", textAlign: TextAlign.center,),
            const SizedBox(height: 20,),
            OtpTextField(
              numberOfFields: 4,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    backgroundColor: Colors.black,
                  ),
                onPressed: () {}, 
                child: Text("Next",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isDarkMode ? Colors.white : Colors.white),),),
            ),
          ],
        ),
      ),
    );
  }
}