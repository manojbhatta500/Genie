import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genie/utils/custom_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class NewChatButton extends StatelessWidget {
  const NewChatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          color: Color(0XFF64748B), borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 2,
          ),
          Icon(
            Icons.add,
            size: 20,
            color: Colors.white,
          ),
          Text(
            'New Chat',
            style: GoogleFonts.crimsonPro(
              color: CustomColors.whiteColor,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            width: 2,
          )
        ],
      ),
    );
  }
}
