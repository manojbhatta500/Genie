import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genie/blocs/fetch_content/fetch_content_bloc.dart';
import 'package:genie/pages/local_content.dart';
import 'package:genie/widgets/saved_chat.dart';
import 'package:genie/widgets/saved_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:genie/main.dart'; // Make sure to import the file where routeObserver is defined

class ArchiveScreen extends StatefulWidget {
  const ArchiveScreen({super.key});

  @override
  State<ArchiveScreen> createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> with RouteAware {
  @override
  void initState() {
    BlocProvider.of<FetchContentBloc>(context).add(FetchContent());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    BlocProvider.of<FetchContentBloc>(context).add(FetchContent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              "Your Archives",
              style: GoogleFonts.crimsonPro(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        backgroundColor: Color(0XFF001C69).withOpacity(0.3),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            SavedChatButton(),
            BlocBuilder<FetchContentBloc, FetchContentState>(
              builder: (context, state) {
                if (state is FetchContentFailed) {
                  return Column(
                    children: [
                      Lottie.asset('assets/error.json'),
                      const SizedBox(height: 10),
                      Text(
                        'Failed to fetch your data. Please try again.',
                        style: GoogleFonts.crimsonPro(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                } else if (state is FetchContentSuccess) {
                  if (state.data.data!.isEmpty) {
                    return Column(
                      children: [
                        Lottie.asset('assets/notfound.json'),
                        const SizedBox(height: 10),
                        Text(
                          "You haven't saved any content. Please try again.",
                          style: GoogleFonts.crimsonPro(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.data.data!.length,
                        itemBuilder: (context, index) {
                          final reversedData =
                              state.data.data!.reversed.toList();
                          return SavedContainer(
                            data: reversedData[index],
                            ontap: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      LocalContent(data: reversedData[index]),
                                ),
                              );

                              if (result == true) {
                                BlocProvider.of<FetchContentBloc>(context)
                                    .add(FetchContent());
                              }
                            },
                          );
                        },
                      ),
                    );
                  }
                } else if (state is FetchContentLoading) {
                  return Column(
                    children: [
                      const SizedBox(height: 10),
                      Lottie.asset('assets/loading.json', width: 100),
                      const SizedBox(height: 10),
                      Text(
                        'Loading your Data, please wait...',
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
                      Lottie.asset('assets/loading.json'),
                      const SizedBox(height: 10),
                      // Text(
                      //   'Failed to fetch your data. Please try again.',
                      //   style: GoogleFonts.crimsonPro(
                      //     color: Colors.black,
                      //     fontSize: 18,
                      //   ),
                      //   textAlign: TextAlign.center,
                      // ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
