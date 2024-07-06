import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genie/utils/custom_colors.dart';
import 'package:genie/widgets/saved_container.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedChatButton extends StatelessWidget {
  const SavedChatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 150,
          height: 40,
          margin: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
              color: Color(0XFF64748B),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 2,
              ),
              Icon(
                Icons.save,
                size: 20,
                color: Colors.white,
              ),
              Text(
                'Saved Contents ',
                style: GoogleFonts.crimsonPro(
                  color: CustomColors.whiteColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        // Text(
        //   "See More",
        //   style: GoogleFonts.crimsonPro(
        //     color: CustomColors.greenColor,
        //     fontSize: 14,
        //     fontWeight: FontWeight.w700,
        //   ),
        // ),
      ],
    );
  }
}
