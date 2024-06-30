import 'package:flutter/material.dart';
import 'package:genie/pages/about_us_screen.dart';
import 'package:genie/pages/privacy_policy.dart';
import 'package:genie/widgets/profile_container.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              "Profile",
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: 0.1 * width, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xFFF5F6F8)),
              child: Column(
                children: [
                  ProfileContainer(
                    title: 'Profile',
                    onButtonPressed: () {},
                  ),
                  ProfileContainer(
                    title: 'About us',
                    onButtonPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AboutUsScreen()));
                    },
                  ),
                  ProfileContainer(
                    title: 'Privacy Policy',
                    onButtonPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PrivacyPolicyScreen()));
                    },
                  ),
                  ProfileContainer(
                    title: 'Log out',
                    onButtonPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}




// about us
// privacy and policy
// share app
// logout
