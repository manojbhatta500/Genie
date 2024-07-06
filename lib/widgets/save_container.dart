import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie/blocs/save_content/save_content_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void SaveContainer(
  BuildContext context, {
  required String title,
  required String hintText,
  required String content,
  required String type,
}) {
  TextEditingController titleController = TextEditingController();
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: GoogleFonts.crimsonPro(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  filled: true,
                  fillColor: Color(0xFFF8F9FA),
                  hintText: hintText,
                  hintStyle: GoogleFonts.crimsonPro(color: Colors.grey),
                ),
                style: GoogleFonts.crimsonPro(color: Colors.black),
              ),
              SizedBox(height: 20),
              BlocListener<SaveContentBloc, SaveContentState>(
                listener: (context, state) {
                  if (state is SaveContentSuccess) {
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //     content: Text(
                    //       'Successfully saved',
                    //       style: GoogleFonts.crimsonPro(color: Colors.white),
                    //     ),
                    //     backgroundColor: Colors.green,
                    //   ),
                    // );
                    Fluttertoast.showToast(
                      msg: 'Successfully saved',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                    Navigator.pop(context);
                  } else if (state is SaveContentFailed) {
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //     content: Text(
                    //       'Could not save sorry !.',
                    //       style: GoogleFonts.crimsonPro(color: Colors.white),
                    //     ),
                    //     backgroundColor: Colors.red,
                    //   ),
                    // );
                    Fluttertoast.showToast(
                      msg: 'Could not save sorry !.',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                    Navigator.pop(context);
                  } else {
                    log('this is just a else so it will probabbly work all the time ');
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (titleController.text.isEmpty) {
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   SnackBar(
                          //     content: Text(
                          //       'you must give have title',
                          //       style:
                          //           GoogleFonts.crimsonPro(color: Colors.white),
                          //     ),
                          //     backgroundColor: Colors.red,
                          //   ),
                          // );
                          Fluttertoast.showToast(
                            msg: 'you must give have title',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }

                        BlocProvider.of<SaveContentBloc>(context).add(
                            SaveContent(
                                title: title, content: content, type: type));

                        // Handle save action
                        // Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Colors.deepPurple,
                        textStyle: GoogleFonts.crimsonPro(fontSize: 18),
                      ),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.deepPurple,
                              Color(0XFF64748B),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          'Save',
                          style: GoogleFonts.crimsonPro(color: Colors.white),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Colors.grey[300],
                        textStyle: GoogleFonts.crimsonPro(fontSize: 18),
                      ),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.crimsonPro(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
