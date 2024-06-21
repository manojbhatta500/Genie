import 'package:flutter/material.dart';
import 'package:genie/features/auth/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}



/*
1.create branch and work on your branch 
2. don't work on main branch 
3.don't use too much package (bloc equatable and other necessary package)

we will use feature folder structure 
-bloc
-repository 
-pages
-widgets 
-utils


for now just this 


for converting text to song 
flutter_tts: ^4.0.2

*/