import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genie/blocs/generate_poetry/generate_poetry_bloc.dart';
import 'package:genie/blocs/generate_story/generate_story_bloc.dart';
import 'package:genie/pages/poetry_result.dart';
import 'package:google_fonts/google_fonts.dart';

class PoetryInput extends StatefulWidget {
  const PoetryInput({super.key});

  @override
  _PoetryInputState createState() => _PoetryInputState();
}

class _PoetryInputState extends State<PoetryInput> {
  final List<String> poemTypes = [
    'Friendship',
    'Sonnet',
    'Haiku',
    'Limerick',
    'Free Verse',
    'Acrostic',
    'Ballad',
    'Epic',
    'Ode',
    'Tanka',
    'Couplet',
    'Elegy',
    'Epigram',
    'Ghazal',
    'Villanelle',
    'Sestina',
  ];
  final List<String> selectedPoemTypes = [];
  String selectedLength = 'Short (1 - 20 lines)';
  final TextEditingController poemInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Generate Poetry',
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
                'Select Poem Types',
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
                children: poemTypes.map((type) {
                  final isSelected = selectedPoemTypes.contains(type);
                  return ChoiceChip(
                    label: Text(type),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedPoemTypes.add(type);
                        } else {
                          selectedPoemTypes.remove(type);
                        }
                      });
                    },
                    selectedColor: Color(0XFF64748B),
                    backgroundColor: Colors.grey[300],
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                    avatar: isSelected
                        ? Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.check,
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
                'Select Length',
                style: GoogleFonts.crimsonPro(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  'Short (1 - 20 lines)',
                  'Medium (20 - 50 lines)',
                  'Long (50+ lines)',
                ].map((length) {
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
                'Enter Poem Details',
                style: GoogleFonts.crimsonPro(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: poemInputController,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Type your poem details here...',
                  hintStyle: GoogleFonts.crimsonPro(color: Colors.grey),
                ),
                style: GoogleFonts.crimsonPro(color: Colors.black),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedPoemTypes.isEmpty ||
                        poemInputController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Please select at least one poetry type and enter Extra poetry details.',
                            style: GoogleFonts.crimsonPro(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      final String screenInput = poemInputController.text;
                      final String prompt = '''
generate a simple poetry or poem and here are the details.
poetry Types: ${selectedPoemTypes.join(', ')}
Story Length: $selectedLength
Story Details: $screenInput
combine all poetry types and return one poetry.
it also must have emoji  and beautiful
''';
                      BlocProvider.of<GeneratePoetryBloc>(context)
                          .add(GeneratePoetry(prompt: prompt));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PoetryResult()));
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
                      'Generate Poem',
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
