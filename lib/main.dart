import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genie/blocs/auth_bloc/auth_bloc.dart';
import 'package:genie/blocs/delete_content/delete_content_bloc.dart';
import 'package:genie/blocs/fetch_content/fetch_content_bloc.dart';
import 'package:genie/blocs/generate_poetry/generate_poetry_bloc.dart';
import 'package:genie/blocs/generate_song/generate_song_bloc.dart';
import 'package:genie/blocs/generate_story/generate_story_bloc.dart';
import 'package:genie/blocs/message/message_bloc.dart';
import 'package:genie/blocs/normal_chat/normal_chat_bloc.dart';
import 'package:genie/blocs/save_content/save_content_bloc.dart';
import 'package:genie/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

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
        BlocProvider(
          create: (context) => SaveContentBloc(),
        ),
        BlocProvider(
          create: (context) => FetchContentBloc(),
        ),
        BlocProvider(
          create: (context) => DeleteContentBloc(),
        ),
      ],
      //
      child: MaterialApp(
        navigatorObservers: [routeObserver],
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
