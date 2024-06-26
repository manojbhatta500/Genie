import 'package:flutter/material.dart';
import 'package:genie/widgets/chat_feild.dart';
import 'package:genie/widgets/message_widgets.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Text Editor',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0XFF64748B),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.save,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ReceiverMessageWidget(message: "Hello! How are you?"),
                SenderMessageWidget(
                    message: "I'm good, thanks! How about you?"),
                ReceiverMessageWidget(
                    message: "I'm fine as well. What are you up to?"),
                SenderMessageWidget(message: "Just working on a project."),
              ],
            ),
          ),
          ChatFeild()
        ],
      ),
    );
  }
}
