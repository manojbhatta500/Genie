import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:genie/pages/message_input.dart';
import 'package:genie/pages/poetry_input.dart';
import 'package:genie/pages/song_input.dart';
import 'package:genie/pages/story_input.dart';
import 'package:genie/repository/story_repository.dart';
import 'package:genie/widgets/custom_banner.dart';
import 'package:genie/widgets/menu_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Menus extends StatelessWidget {
  const Menus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Lottie.asset('assets/hi.json', height: 60),
            SizedBox(
              width: 10,
            ),
            Text(
              "Hi",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomBanner(),
            Wrap(
              children: [
                MenuContainer(
                    title: "Stories",
                    desc: "Generate amazing stories",
                    imageAddress: 'assets/story.json',
                    onButtonPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StoryInput()));
                    }),
                MenuContainer(
                    title: "Poetry",
                    desc: "Compose beautiful poems",
                    imageAddress: 'assets/poem.json',
                    onButtonPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PoetryInput()));
                    }),
                MenuContainer(
                    title: "Songs",
                    desc: "Create unique songs",
                    imageAddress: 'assets/song.json',
                    onButtonPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SongInput()));
                    }),
                MenuContainer(
                    title: "Messages",
                    desc: "Craft flirty and love messages",
                    imageAddress: 'assets/love.json',
                    onButtonPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MessageInput()));
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
