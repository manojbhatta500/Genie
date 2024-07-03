import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SongInput extends StatefulWidget {
  const SongInput({super.key});

  @override
  State<SongInput> createState() => _SongInputState();
}

class _SongInputState extends State<SongInput> {
  final List<String> songThemes = [
    'Love',
    'Heartbreak',
    'Friendship',
    'Inspiration',
    'Hope',
    'Dreams',
    'Nature',
    'Adventure',
    'Reflection',
    'Nostalgia',
    'Celebration',
  ];

  final List<String> genres = [
    'Pop',
    'Rock',
    'Hip-hop',
    'Country',
    'Jazz',
    'Electronic',
    'Classical',
    'R&B',
    'Indie',
    'Folk',
    'Reggae',
    'Metal',
  ];

  final List<String> selectedSongThemes = [];
  final List<String> selectedGenres = [];
  final TextEditingController songInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Song',
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
                'Select Song Themes',
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
                children: songThemes.map((theme) {
                  final isSelected = selectedSongThemes.contains(theme);
                  return ChoiceChip(
                    label: Text(theme),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedSongThemes.add(theme);
                        } else {
                          selectedSongThemes.remove(theme);
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
                'Select Genre',
                style: GoogleFonts.crimsonPro(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: genres.map((genre) {
                  final isSelected = selectedGenres.contains(genre);
                  return ChoiceChip(
                    label: Text(genre),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedGenres.add(genre);
                        } else {
                          selectedGenres.remove(genre);
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
                'Enter Song Lyrics',
                style: GoogleFonts.crimsonPro(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: songInputController,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Type your song description here...',
                  hintStyle: GoogleFonts.crimsonPro(color: Colors.grey),
                ),
                style: GoogleFonts.crimsonPro(color: Colors.black),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
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
                      'Create Song',
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
