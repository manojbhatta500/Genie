import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SenderMessageWidget extends StatelessWidget {
  final String message;

  const SenderMessageWidget({Key? key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
          SvgPicture.asset(
            'assets/man.svg',
            height: 25,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}

class ReceiverMessageWidget extends StatelessWidget {
  final String message;

  const ReceiverMessageWidget({Key? key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 10,
          ),
          SvgPicture.asset(
            'assets/robat.svg',
            height: 25,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20)),
            ),
            child: Text(
              message,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
