import 'package:flutter/material.dart';
import 'package:genie/utils/custom_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 55,
      width: 0.8 * width,
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
              'Get Started',
              style: GoogleFonts.crimsonPro(
                color: CustomColors.whiteColor,
                fontSize: 19,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 27.0,
          )
        ],
      ),
    );
  }
}
