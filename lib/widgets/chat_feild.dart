import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genie/utils/custom_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatFeild extends StatelessWidget {
  ChatFeild({
    super.key,
  });
  TextEditingController sendMessage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 55,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Color(0XFFE2E8F0),
            blurRadius: 10,
            offset: Offset(0, 6),
            spreadRadius: 10,
          ),
          BoxShadow(
            color: Color(0XFFE2E8F0).withOpacity(0.7),
            blurRadius: 5,
            offset: Offset(0, 3),
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: TextField(
          cursorColor: Colors.black38,
          controller: sendMessage,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            suffixIcon: SvgPicture.asset(
              'assets/send.svg',
              height: 25,
            ),
            alignLabelWithHint: true,
            filled: true,
            fillColor: Colors.transparent,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
            hintText: 'Write your message',
            hintStyle: GoogleFonts.nunito(
              color: Color(0XFFA1A1A1),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            enabled: true,
          ),
        ),
      ),
    );
  }
}
