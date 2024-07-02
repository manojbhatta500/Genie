import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genie/blocs/normal_chat/normal_chat_bloc.dart';
import 'package:genie/blocs/normal_chat/normal_chat_state.dart';
import 'package:genie/widgets/chat_feild.dart';
import 'package:genie/widgets/message_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart'; // Assuming this imports your message widgets

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Genie',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0XFF64748B),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(
        //       Icons.save,
        //       color: Colors.white,
        //     ),
        //   )
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<NormalChatBloc, NormalChatState>(
                builder: (context, state) {
                  print('BlocBuilder state: $state');

                  if (state.messages.isNotEmpty) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (_scrollController.hasClients) {
                        _scrollController.jumpTo(
                          _scrollController.position.maxScrollExtent,
                        );
                      }
                    });

                    final messages = state.messages;
                    return ListView.builder(
                      controller: _scrollController,
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages[index];
                        final isLoading = state is NormalChatLoading &&
                            index == messages.length - 1 &&
                            message.startsWith("Bot: ");
                        print(
                            'Building message widget. isLoading: $isLoading, message: $message');
                        return buildMessageWidget(message, isLoading);
                      },
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            child: Lottie.asset('assets/chatai.json'),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Hello, chat with me!',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.crimsonPro(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'I\'m here to answer your questions and chat about anything!',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: Colors.grey[700],
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(height: 12),
            ChatField(),
          ],
        ),
      ),
    );
  }

  Widget buildMessageWidget(String message, bool isLoading) {
    if (message.startsWith("User: ")) {
      return SenderMessageWidget(
        message: message.replaceFirst("User: ", ""),
      );
    } else if (message.startsWith("Bot: ")) {
      return ReceiverMessageWidget(
        message: message.replaceFirst("Bot: ", ""),
        isLoading: isLoading,
      );
    }
    return SizedBox.shrink(); // Handle unexpected message format
  }
}
