import 'package:flutter/material.dart';

import '../signup_screen/signup_screen.dart';
import '../signin_screen/signin_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),

            child: Column(
              children: [

                // الصورة
                SizedBox(
                  height: screenHeight * 0.43,
                  child: Image.asset(
                    'assets/images/Group 7091.png',
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 5),

                // العنوان
                const Text(
                  'Welcome to our app',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff7F4E1D),
                  ),
                ),

                const SizedBox(height: 10),

                // الوصف
                const Text(
                  'Shop online and get groceries\n'
                      'delivered from our stores to your home\n'
                      'in as fast as 1 hour.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xff7F4E1D),
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 22),

                // Sign Up

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ), // القوسين هنا كان ناقصين وتم تصحيح الإغلاق
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFF5E00),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: const Text('Sign Up'), // أكملي الـ Text هنا حسب رغبتك
                  ),
                ),


                const SizedBox(height: 12),

                // Sign In
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SigninScreen(),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFFE9A15F),
                      side: const BorderSide(
                        color: Color(0xFFE9A15F),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}