import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genie/widgets/saved_chat.dart';
import 'package:genie/widgets/saved_container.dart';
import 'package:google_fonts/google_fonts.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              "Your Archives",
              style: GoogleFonts.crimsonPro(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        backgroundColor: Color(0XFF001C69).withOpacity(0.3),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            SavedChatButton(),
            Expanded(
              child: ListView.builder(
                itemCount: 100, // Set the number of items
                itemBuilder: (context, index) {
                  return SavedContainer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
