import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genie/blocs/fetch_content/fetch_content_bloc.dart';
import 'package:genie/pages/local_content.dart';
import 'package:genie/widgets/saved_chat.dart';
import 'package:genie/widgets/saved_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ArchiveScreen extends StatefulWidget {
  const ArchiveScreen({super.key});

  @override
  State<ArchiveScreen> createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> {
  @override
  void initState() {
    BlocProvider.of<FetchContentBloc>(context).add(FetchContent());
    super.initState();
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
                  return Text('it failed sorry bro');
                } else if (state is FetchContentSuccess) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount:
                          state.data.data!.length, // Set the number of items
                      itemBuilder: (context, index) {
                        final reversedData = state.data.data!.reversed.toList();
                        return SavedContainer(
                          data: reversedData[index],
                          ontap: () {
                            // print(reversedData[index].createdAt);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LocalContent(
                                        data: reversedData[index])));
                          },
                        );
                      },
                    ),
                  );
                } else if (state is FetchContentLoading) {
                  return Text('it is loading bro wait');
                } else {
                  return Text(
                      'it is else state will probally not happen bro wait');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

// SavedContainer();
