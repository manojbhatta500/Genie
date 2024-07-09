import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:genie/pages/bottomnavbar.dart';
import 'package:genie/pages/login.dart';
import 'package:genie/repository/key_repository.dart';
import 'package:genie/repository/story_repository.dart';
import 'package:genie/utils/key.dart';
import 'package:genie/utils/token_service.dart';
import 'package:genie/widgets/get_started_button.dart';
import 'package:genie/utils/custom_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    KeyRepository manager = KeyRepository();
    final repoResponse = manager.fetchGeminiKey();
    log(repoResponse.toString());

    _checkTokenAndNavigate();

    super.initState();
  }

  Future<void> _checkTokenAndNavigate() async {
    await Future.delayed(
        Duration(seconds: 2)); // To show splash screen for 2 seconds
    String? token = await tokenService.getToken();
    log("Token: $token");

    if (token != null && token.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                BottomNavBar()), // Navigate to the home screen
      );
    }
  }

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
              'Genie',
              style: GoogleFonts.crimsonPro(
                color: CustomColors.purpleColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'You AI Assistant',
              style: GoogleFonts.crimsonPro(
                color: CustomColors.purpleColor,
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.1 * width),
              child: Text(
                "Using this software,you can ask your questions and receive answers using artificial intelligence assistant.",
                textAlign: TextAlign.center,
                style: GoogleFonts.crimsonPro(
                  color: CustomColors.greenColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Lottie.asset('assets/splash.json', height: 0.5 * height),
            Spacer(),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: GetStartedButton())
          ],
        ),
      ),
    );
  }
}
