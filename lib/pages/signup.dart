import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:genie/blocs/auth_bloc/auth_bloc.dart';
import 'package:genie/pages/chat_screen.dart';
import 'package:genie/pages/login.dart';
import 'package:genie/widgets/custom_form_feild.dart';
import 'package:genie/widgets/password_form.dart';
import 'package:genie/utils/custom_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmController = TextEditingController();

  TextEditingController userNameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 0.03 * height,
            ),
            Text(
              'You AI Assistant',
              style: GoogleFonts.crimsonPro(
                color: CustomColors.purpleColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Genie',
              style: GoogleFonts.crimsonPro(
                color: CustomColors.purpleColor,
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 0.1 * height,
            ),
            Center(
              child: Text(
                "SignUp ",
                textAlign: TextAlign.center,
                style: GoogleFonts.crimsonPro(
                  color: CustomColors.purpleColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            CustomTextFormField(
              hintText: 'UserName',
              controller: userNameController,
              prefixIcon: SizedBox(
                  child: Icon(
                Icons.person,
                color: CustomColors.purpleColor,
              )),
            ),
            CustomTextFormField(
              hintText: 'E-mail ID',
              controller: emailController,
              prefixIcon: SizedBox(
                child: SvgPicture.asset(
                  'assets/mess.svg',
                  width: 15,
                  height: 15,
                ),
              ),
            ),
            PasswordForm(
              hintText: 'Password',
              controller: passwordController,
              obscureIcon: SvgPicture.asset(
                'assets/lock.svg',
                width: 15,
                height: 15,
              ),
              revealIcon: Icon(
                Icons.visibility,
                color: Colors.blue,
              ),
            ),
            PasswordForm(
              hintText: 'Confirm Password',
              controller: confirmController,
              obscureIcon: SvgPicture.asset(
                'assets/lock.svg',
                width: 15,
                height: 15,
              ),
              revealIcon: Icon(
                Icons.visibility,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is SignupSuccess) {
                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //     backgroundColor: Colors.green,
                  //     content: Text('Account successfully created')));
                  _showSuccessDialog(context);

                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => ChatScreen()));
                } else if (state is SignupFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Signup Failed try again')));
                } else {
                  log('this is log of this ');
                }
              },
              child: GestureDetector(
                onTap: () {
                  if (passwordController.text == confirmController.text) {
                    BlocProvider.of<AuthBloc>(context).add(SignupEvent(
                      email: emailController.text,
                      password: passwordController.text,
                      username: userNameController.text,
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("Both password should match")));
                  }
                },
                child: Container(
                  height: 50,
                  width: 0.7 * width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: CustomColors.purpleColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state is SignupLoading) {
                            return Align(
                                alignment: Alignment.center,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ));
                          } else {
                            return Align(
                              alignment: Alignment.center,
                              child: Text(
                                'SignUp',
                                style: GoogleFonts.crimsonPro(
                                  color: CustomColors.whiteColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text(
                'Already have an account? LogIn',
                style: GoogleFonts.crimsonPro(
                  color: Color(0XFF64748B),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Success"),
        content: Text("Account successfully created"),
        actions: <Widget>[
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      );
    },
  );
}
