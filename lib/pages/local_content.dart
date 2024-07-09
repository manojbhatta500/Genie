import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genie/blocs/delete_content/delete_content_bloc.dart';
import 'package:genie/blocs/fetch_content/fetch_content_bloc.dart';
import 'package:genie/models/content_model.dart';
import 'package:google_fonts/google_fonts.dart';

class LocalContent extends StatelessWidget {
  const LocalContent({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    final cleanedPromptResponse = data.content!
        .replaceAll('#', '')
        .replaceAll('"', '')
        .replaceAll('*', '');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          data.title!,
          style: GoogleFonts.crimsonPro(color: Colors.white),
        ),
        backgroundColor: const Color(0XFF64748B),
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          BlocListener<DeleteContentBloc, DeleteContentState>(
            listener: (context, state) {
              if (state is DeleteContentSuccess) {
                log('delete content success is called');
                Navigator.pop(
                    context, true); // Pass true to indicate a successful delete
              } else if (state is DeleteContentFailed) {
                log('delete content failed is called');
                Navigator.pop(context, false); // Pass false to indicate failure
              } else if (state is DeleteContentLoading) {
                log('delete content loading is called');
              } else {
                log('this will probably not happen');
              }
            },
            child: IconButton(
              onPressed: () {
                BlocProvider.of<DeleteContentBloc>(context)
                    .add(DeleteContent(id: data.sId!));
              },
              icon: Icon(Icons.delete),
            ),
          )
        ],
      ),
      body: Container(
        color: const Color(0xFFF8F9FA),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  cleanedPromptResponse,
                  style: GoogleFonts.crimsonPro(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pop(); // No need to fetch content here
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.deepPurple,
                    textStyle: GoogleFonts.crimsonPro(fontSize: 18),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Colors.deepPurple,
                          Color(0XFF64748B),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: Text(
                      'Go Back Now',
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
