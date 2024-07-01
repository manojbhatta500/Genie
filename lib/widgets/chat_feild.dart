import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genie/blocs/normal_chat/normal_chat_bloc.dart';
import 'package:genie/blocs/normal_chat/normal_chat_event.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatField extends StatelessWidget {
  const ChatField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController sendMessageController = TextEditingController();

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 55,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Color(0XFFE2E8F0),
            blurRadius: 10,
            offset: Offset(0, 6),
            spreadRadius: 10,
          ),
          BoxShadow(
            color: Color(0XFFE2E8F0).withOpacity(0.7),
            blurRadius: 5,
            offset: Offset(0, 3),
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: sendMessageController,
                cursorColor: Colors.black38,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Write your message',
                  hintStyle: GoogleFonts.nunito(
                    color: Color(0XFFA1A1A1),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                String message = sendMessageController.text.trim();
                if (message.isNotEmpty) {
                  BlocProvider.of<NormalChatBloc>(context)
                      .add(SendUserChat(userString: message));
                  sendMessageController.clear();
                }
              },
              child: Container(
                padding: EdgeInsets.all(8),
                child: SvgPicture.asset(
                  'assets/send.svg',
                  height: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
