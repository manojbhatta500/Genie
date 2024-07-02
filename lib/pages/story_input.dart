import 'package:flutter/material.dart';
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
  String selectedLength = '0 to 100';
  final TextEditingController storyInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Generate Story',
          style: GoogleFonts.lato(color: Colors.white),
        ),
        backgroundColor: Color(0XFF64748B),
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Story Types',
                style: GoogleFonts.crimsonPro(
                  color: Color(0XFF64748B),
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
                    selectedColor: Colors.deepPurple,
                    backgroundColor: Colors.grey[200],
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Select Length',
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton<String>(
                  value: selectedLength,
                  isExpanded: true,
                  underline: SizedBox(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedLength = newValue!;
                    });
                  },
                  items: <String>[
                    '0 to 100',
                    '100 to 1000',
                    '1000 to 2000',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Enter Story Details',
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: storyInputController,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'Type your story details here...',
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle story generation logic
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.deepPurple,
                    textStyle: GoogleFonts.lato(fontSize: 18),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.deepPurple, Colors.purpleAccent],
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text(
                      'Generate Story',
                      style: GoogleFonts.lato(color: Colors.white),
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
