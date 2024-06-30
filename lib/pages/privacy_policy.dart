import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
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
                child: Icon(
                  Icons.privacy_tip,
                  color: Color(0XFF001C69),
                  size: 100,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Privacy Policy',
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
                'We are committed to protecting your privacy. This app does not collect any personal user data. We only perform basic CRUD operations with securely managed server data.',
                style: GoogleFonts.crimsonPro(
                  color: Colors.grey[800],
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 20),
              SectionHeader(title: 'Data Collection'),
              SizedBox(height: 10),
              Text(
                'This app does not collect any user data. All interactions are performed with server data only.',
                style: GoogleFonts.crimsonPro(
                  color: Colors.grey[800],
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 20),
              SectionHeader(title: 'Data Usage'),
              SizedBox(height: 10),
              Text(
                'Data usage is limited to performing necessary operations and is not stored locally on the device.',
                style: GoogleFonts.crimsonPro(
                  color: Colors.grey[800],
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 20),
              SectionHeader(title: 'Data Protection'),
              SizedBox(height: 10),
              Text(
                'We implement robust security measures to protect server data from unauthorized access.',
                style: GoogleFonts.crimsonPro(
                  color: Colors.grey[800],
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 20),
              SectionHeader(title: 'Contact Us'),
              SizedBox(height: 10),
              Text(
                'For any inquiries, please contact us at manoj.bhatta500@gmail.com.',
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
