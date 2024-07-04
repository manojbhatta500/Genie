import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genie/blocs/auth_bloc/auth_bloc.dart';
import 'package:genie/blocs/generate_poetry/generate_poetry_bloc.dart';
import 'package:genie/blocs/generate_song/generate_song_bloc.dart';
import 'package:genie/blocs/generate_story/generate_story_bloc.dart';
import 'package:genie/blocs/message/message_bloc.dart';
import 'package:genie/blocs/normal_chat/normal_chat_bloc.dart';
import 'package:genie/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => NormalChatBloc(),
        ),
        BlocProvider(
          create: (context) => GenerateStoryBloc(),
        ),
        BlocProvider(
          create: (context) => GeneratePoetryBloc(),
        ),
        BlocProvider(
          create: (context) => GenerateSongBloc(),
        ),
        BlocProvider(
          create: (context) => MessageBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
