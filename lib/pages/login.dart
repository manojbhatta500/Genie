import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genie/blocs/auth_bloc/auth_bloc.dart';
import 'package:genie/pages/bottomnavbar.dart';
import 'package:genie/pages/chat_screen.dart';
import 'package:genie/pages/signup.dart';
import 'package:genie/utils/token_service.dart';
import 'package:genie/widgets/custom_form_feild.dart';
import 'package:genie/widgets/password_form.dart';
import 'package:genie/utils/custom_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email_controller = TextEditingController();

  TextEditingController password_controller = TextEditingController();

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 0.08 * height,
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
                  "Login ",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.crimsonPro(
                    color: CustomColors.purpleColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              CustomTextFormField(
                hintText: 'E-mail ID',
                controller: email_controller,
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
                controller: password_controller,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value ?? false;
                          });
                        },
                      ),
                      Text(
                        'Remember Me',
                        style: GoogleFonts.crimsonPro(
                          color: Color(0XFF64748B),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => BottomNavBar()));
                    },
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.crimsonPro(
                        color: Color(0XFF64748B),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is LoginLoading) {
                    log('this is login loading state');
                  } else if (state is LoginFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Failed Login. Try Again')));
                  } else if (state is LoginSuccess) {
                    if (_isChecked == true) {
                      tokenService.saveToken(state.data.token!);
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavBar()));
                  } else {
                    log('this is else state');
                  }
                },
                child: GestureDetector(
                  onTap: () {
                    log('this is login screen email checker : ${email_controller.text}');

                    BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                        email: email_controller.text,
                        password: password_controller.text));
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
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Login',
                            style: GoogleFonts.crimsonPro(
                              color: CustomColors.whiteColor,
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
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
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                child: Text(
                  "Don't have an account? Sign Up",
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
      ),
    );
  }
}
