import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SenderMessageWidget extends StatelessWidget {
  final String message;

  const SenderMessageWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 0.9 * width,
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0XFF64748B),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Text(
                  message,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    Colors.black.withOpacity(0.2), // Example background color
              ),
              child: Container(
                width: 30,
                height: 30,
                child: Lottie.asset('assets/bot.json'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReceiverMessageWidget extends StatelessWidget {
  final String message;
  final bool isLoading;

  const ReceiverMessageWidget({
    Key? key,
    required this.message,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // Remove unwanted characters
    String cleanedMessage = message.replaceAll('*', '').replaceAll('#', '');

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 0.9 * width,
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    Colors.black.withOpacity(0.2), // Example background color
              ),
              child: Container(
                width: 30,
                height: 50,
                child: Lottie.asset('assets/bot.json'),
              ),
            ),
            SizedBox(width: 10),
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0XFFEEEEEE),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: isLoading
                    ? Text('.........')
                    : Text(
                        cleanedMessage,
                        style: GoogleFonts.crimsonPro(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
