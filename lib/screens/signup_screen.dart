import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../widgets/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),

          child: Column(
            children: [

              Image.asset(
                "assets/logo/logo1.jfif",
                width: 200,
              ),

              const SizedBox(height: 20),

              const Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              const CustomTextField(
                hint: "Full Name",
                icon: Icons.person_outline,
              ),

              const CustomTextField(
                hint: "Email",
                icon: Icons.email_outlined,
              ),

              const CustomTextField(
                hint: "Password",
                icon: Icons.lock_outline,
                isPassword: true,
              ),

              const CustomTextField(
                hint: "Confirm Password",
                icon: Icons.lock_outline,
                isPassword: true,
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  style:
                  ElevatedButton.styleFrom(
                    backgroundColor:
                    AppColors.primary,
                  ),

                  onPressed: () {},

                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}