import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genie/blocs/message/message_bloc.dart';
import 'package:genie/widgets/save_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class MessageResult extends StatelessWidget {
  const MessageResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Results',
          style: GoogleFonts.crimsonPro(color: Colors.white),
        ),
        backgroundColor: const Color(0XFF64748B),
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: const Color(0xFFF8F9FA),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Response:',
                style: GoogleFonts.crimsonPro(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                child: BlocBuilder<MessageBloc, MessageState>(
                  builder: (context, state) {
                    if (state is MessageLoading) {
                      return Column(
                        children: [
                          //

                          Lottie.asset('assets/love.json'),
                          const SizedBox(height: 10),

                          Lottie.asset('assets/loading.json', width: 100),
                          const SizedBox(height: 10),

                          Text(
                            'Generating your Poetry, please wait...',
                            style: GoogleFonts.crimsonPro(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    } else if (state is MessageSuccess) {
                      // Clean the prompt response
                      final cleanedPromptResponse = state.outputPrompt
                          .replaceAll('#', '')
                          .replaceAll('"', '')
                          .replaceAll('*', '');

                      return Text(
                        cleanedPromptResponse,
                        style: GoogleFonts.crimsonPro(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      );
                    } else if (state is MessageFailed) {
                      return Column(
                        children: [
                          Lottie.asset('assets/error.json'),
                          const SizedBox(height: 10),
                          Text(
                            'Oops! blocked due to safety. Please try again.',
                            style: GoogleFonts.crimsonPro(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          Lottie.asset('assets/error.json'),
                          const SizedBox(height: 10),
                          Text(
                            'Something went wrong. Please try again.',
                            style: GoogleFonts.crimsonPro(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
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
                      'Back to Generate',
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
