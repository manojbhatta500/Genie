import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us',
          style: GoogleFonts.crimsonPro(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Color(0XFF001C69).withOpacity(0.8),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Color(0XFF001C69),
                  child: Icon(
                    Icons.people,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'About Us',
                  style: GoogleFonts.crimsonPro(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Divider(color: Colors.grey, thickness: 1, height: 30),
              Text(
                'We are committed to providing innovative solutions to enhance your digital experience. Our app utilizes advanced AI models to create a personalized interaction similar to ChatGPT. Users can explore their creativity by writing songs, poems, love messages, and more, making it an ideal companion for overcoming boredom and fostering creativity.',
                style: GoogleFonts.crimsonPro(
                  color: Colors.grey[800],
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0XFF001C69),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: Text(
                    'Back to Profile',
                    style: GoogleFonts.crimsonPro(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.fiber_manual_record, color: Color(0XFF001C69), size: 10),
        SizedBox(width: 8),
        Text(
          title,
          style: GoogleFonts.crimsonPro(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
