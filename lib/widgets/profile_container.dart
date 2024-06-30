import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genie/utils/custom_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ProfileContainer extends StatelessWidget {
  ProfileContainer({
    super.key,
    required this.title,
    required this.onButtonPressed,
  });

  late String title;
  late VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onButtonPressed,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: GoogleFonts.crimsonPro(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.keyboard_arrow_right,
              color: CustomColors.greenColor,
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
      ),
    );
  }
}
