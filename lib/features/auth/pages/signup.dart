import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:genie/features/auth/pages/chat_screen.dart';
import 'package:genie/features/auth/pages/login.dart';
import 'package:genie/features/auth/widgets/custom_form_feild.dart';
import 'package:genie/features/auth/widgets/password_form.dart';
import 'package:genie/utils/custom_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 0.08 * height,
            ),
            Text(
              'You AI Assistant',
              style: GoogleFonts.crimsonPro(
                color: CustomColors.purpleColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Genie',
              style: GoogleFonts.crimsonPro(
                color: CustomColors.purpleColor,
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 0.1 * height,
            ),
            Center(
              child: Text(
                "SignUp ",
                textAlign: TextAlign.center,
                style: GoogleFonts.crimsonPro(
                  color: CustomColors.purpleColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            CustomTextFormField(
              hintText: 'E-mail ID',
              controller: emailController,
              prefixIcon: SizedBox(
                child: SvgPicture.asset(
                  'assets/mess.svg',
                  width: 15,
                  height: 15,
                ),
              ),
            ),
            PasswordForm(
              hintText: 'Password',
              controller: passwordController,
              obscureIcon: SvgPicture.asset(
                'assets/lock.svg',
                width: 15,
                height: 15,
              ),
              revealIcon: Icon(
                Icons.visibility,
                color: Colors.blue,
              ),
            ),
            PasswordForm(
              hintText: 'Confirm Password',
              controller: confirmController,
              obscureIcon: SvgPicture.asset(
                'assets/lock.svg',
                width: 15,
                height: 15,
              ),
              revealIcon: Icon(
                Icons.visibility,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatScreen()));
              },
              child: Container(
                height: 50,
                width: 0.7 * width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: CustomColors.purpleColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'SignUp',
                        style: GoogleFonts.crimsonPro(
                          color: CustomColors.whiteColor,
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text(
                'Already have an account? LogIn',
                style: GoogleFonts.crimsonPro(
                  color: Color(0XFF64748B),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
