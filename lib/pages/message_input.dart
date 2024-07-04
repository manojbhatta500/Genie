import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genie/blocs/message/message_bloc.dart';
import 'package:genie/pages/message_result.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageInput extends StatefulWidget {
  const MessageInput({super.key});

  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  String selectedMessageType = 'Friendly';
  final TextEditingController situationController = TextEditingController();

  final Map<String, List<String>> messageSuggestions = {
    'Friendly': [
      "Hey buddy, how are you?",
      "Just wanted to catch up with you!",
      "Hope you are having a great day!",
      "Thanks for being there for me.",
      "Let's hang out soon!"
    ],
    'Encouraging': [
      "You've got this!",
      "Believe in yourself, you can do it!",
      "Sending positive vibes your way!",
      "Keep pushing forward, great things are coming.",
      "You are stronger than you think!"
    ],
    'Romantic': [
      "Every moment with you is a blessing.",
      "You're the love of my life.",
      "I can't wait to see you again.",
      "You're my everything.",
      "Thinking of you always makes my day brighter."
    ],
    'Funny': [
      "You're so funny, you always make me laugh!",
      "Life is better when you're laughing.",
      "Thanks for being the reason I smile.",
      "You're my favorite comedian.",
      "You crack me up!"
    ],
    'Apology': [
      "I'm sorry, I didn't mean to hurt you.",
      "Please forgive me, I value our relationship.",
      "I regret my actions and apologize.",
      "I apologize for my mistake, let's make things right.",
      "I'm deeply sorry, I hope you can forgive me."
    ],
  };

  List<String> selectedMessageList = [];

  @override
  void initState() {
    super.initState();
    selectedMessageList = messageSuggestions[selectedMessageType] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Message Suggestions',
          style: GoogleFonts.crimsonPro(color: Colors.white),
        ),
        backgroundColor: Color(0XFF64748B),
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Color(0xFFF8F9FA),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Message Type',
                style: GoogleFonts.crimsonPro(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: selectedMessageType,
                onChanged: (String? value) {
                  setState(() {
                    selectedMessageType = value!;
                    selectedMessageList =
                        messageSuggestions[selectedMessageType] ?? [];
                  });
                },
                items: messageSuggestions.keys
                    .map<DropdownMenuItem<String>>((String key) {
                  return DropdownMenuItem<String>(
                    value: key,
                    child: Text(
                      key,
                      style: GoogleFonts.crimsonPro(color: Colors.black),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Describe the Situation',
                style: GoogleFonts.crimsonPro(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: situationController,
                maxLines:
                    5, // Increase the number of lines for a larger input area
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter the situation...',
                  hintStyle: GoogleFonts.crimsonPro(color: Colors.grey),
                ),
                style: GoogleFonts.crimsonPro(color: Colors.black),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (situationController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Please select at least one story type and enter Extra story details.',
                            style: GoogleFonts.crimsonPro(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      final String screenInput = situationController.text;
                      final String prompt = '''
generate a simple message response  here are the details.

discripton : $screenInput

it also must have emoji  and beautiful
''';
                      BlocProvider.of<MessageBloc>(context)
                          .add(GenerateMessage(inputPrompt: prompt));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MessageResult()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.deepPurple,
                    textStyle: GoogleFonts.crimsonPro(fontSize: 18),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.deepPurple,
                          Color(0XFF64748B),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text(
                      'Generate Messages',
                      style: GoogleFonts.crimsonPro(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Message Suggestions',
                style: GoogleFonts.crimsonPro(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: selectedMessageList.length,
                itemBuilder: (context, index) {
                  final suggestion = selectedMessageList[index];
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(
                        suggestion,
                        style: GoogleFonts.crimsonPro(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
                        // Handle tapping on message suggestion
                        // You can implement logic here to use the selected message
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
