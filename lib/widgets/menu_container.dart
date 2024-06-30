import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class MenuContainer extends StatelessWidget {
  MenuContainer(
      {super.key,
      required this.title,
      required this.desc,
      required this.imageAddress,
      required this.onButtonPressed});

  late String title;
  late String desc;
  late String imageAddress;
  late VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonPressed,
      child: Container(
        // height: 180,
        width: 160,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        padding: const EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(imageAddress, height: 100),
              Text(
                title,
                style: GoogleFonts.crimsonPro(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                desc,
                textAlign: TextAlign.center,
                style: GoogleFonts.crimsonPro(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
