import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:genie/blocs/generate_story/generate_story_bloc.dart';
import 'package:genie/pages/story_result.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryInput extends StatefulWidget {
  const StoryInput({super.key});

  @override
  _StoryInputState createState() => _StoryInputState();
}

class _StoryInputState extends State<StoryInput> {
  final List<String> storyTypes = [
    'Romance',
    'Adventure',
    'Sci-Fi',
    'Mystery',
    'Fantasy',
    'Horror',
    'Comedy',
    'Drama',
    'Thriller',
    'Historical',
    'Western',
    'Action',
    'Biography',
    'Memoir',
    'Self-help',
    'Health',
    'Travel',
    'Guide',
    'Children',
    'Cooking',
    'Art',
    'Poetry',
    'Motivation',
    'Religion',
    'Philosophy'
  ];
  final List<String> selectedStoryTypes = [];
  String selectedLength = '0 - 100';
  final TextEditingController storyInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Generate Your Story',
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
                'Select Story Types',
                style: GoogleFonts.crimsonPro(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: storyTypes.map((type) {
                  final isSelected = selectedStoryTypes.contains(type);
                  return ChoiceChip(
                    label: Text(type),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedStoryTypes.add(type);
                        } else {
                          selectedStoryTypes.remove(type);
                        }
                      });
                    },
                    selectedColor: Color(0XFF64748B),
                    backgroundColor: Colors.grey[300],
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                    avatar: isSelected
                        ? CircleAvatar(
                            backgroundColor: Colors.white,
                            child: FaIcon(
                              FontAwesomeIcons.solidHeart,
                              color: Colors.white,
                              size: 16,
                            ),
                          )
                        : null,
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Choose Story Length',
                style: GoogleFonts.crimsonPro(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Column(
                children:
                    ['0 - 100', '100 - 1000', '1000 - 2000'].map((length) {
                  return RadioListTile<String>(
                    title: Text(length,
                        style: GoogleFonts.crimsonPro(color: Colors.black)),
                    value: length,
                    groupValue: selectedLength,
                    onChanged: (String? value) {
                      setState(() {
                        selectedLength = value!;
                      });
                    },
                    activeColor: Colors.deepPurple,
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Enter Story Details',
                style: GoogleFonts.crimsonPro(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: storyInputController,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Tell us your story...',
                  hintStyle: GoogleFonts.crimsonPro(color: Colors.grey),
                ),
                style: GoogleFonts.crimsonPro(color: Colors.black),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedStoryTypes.isEmpty ||
                        storyInputController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Please select at least one story type and enter your story details.',
                            style: GoogleFonts.crimsonPro(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      final String screenInput = storyInputController.text;
                      final String prompt = '''
Story Types: ${selectedStoryTypes.join(', ')}
Story Length: $selectedLength
Story Details: $screenInput
combine all story types and return one story
''';
                      BlocProvider.of<GenerateStoryBloc>(context)
                          .add(GenerateStory(prompt: prompt));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StoryResult()));
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
                      'Generate Story',
                      style: GoogleFonts.crimsonPro(color: Colors.white),
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
