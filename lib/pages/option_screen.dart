import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genie/pages/chat_screen.dart';
import 'package:genie/widgets/new_chat_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Color(0XFFF0F0F0)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Lottie.asset(
                    'assets/bot.json',
                    height: 100,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  'Welcome to Genie AI!',
                  style: GoogleFonts.crimsonPro(
                    color: Color(0XFF001C69),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Genie AI is here to assist you with a variety of tasks. Whether you need help with answering questions, generating content, or managing your daily activities, Genie AI has got you covered.',
                style: GoogleFonts.crimsonPro(
                  color: Colors.black87,
                  fontSize: 18,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Features:',
                style: GoogleFonts.crimsonPro(
                  color: Color(0XFF001C69),
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFeatureItem(
                        'Answering your queries', Icons.question_answer),
                    _buildFeatureItem('Writing poems', Icons.library_books),
                    _buildFeatureItem('Sharing jokes', Icons.emoji_emotions),
                    _buildFeatureItem('Recommending books', Icons.book),
                    _buildFeatureItem('And much more...', Icons.more_horiz),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreen()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0XFF001C69), Color(0XFF0072FF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    child: Text(
                      'Start Chatting',
                      style: GoogleFonts.crimsonPro(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
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

  Widget _buildFeatureItem(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(icon, color: Color(0XFF001C69)),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.crimsonPro(
                color: Colors.black87,
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
