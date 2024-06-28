import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genie/utils/custom_colors.dart';
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
          width: 130,
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
                'Saved Chat ',
                style: GoogleFonts.crimsonPro(
                  color: CustomColors.whiteColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Text(
          "See More",
          style: GoogleFonts.crimsonPro(
            color: CustomColors.greenColor,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class SavedChatMenu extends StatelessWidget {
  const SavedChatMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('hello world'),
            Text('hello world'),
            Text('hello world'),
            Text('hello world'),
            Text('hello world'),
            Text('hello world'),
            Text('hello world'),
            Text('hello world'),
          ],
        ),
      ),
    );
  }
}
