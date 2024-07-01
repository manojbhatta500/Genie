import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        width: 0.8 * width,
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

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 0.8 * width,
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
                height: 30,
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
                    ? TypingIndicator()
                    : Text(
                        message,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TypingIndicator extends StatefulWidget {
  @override
  _TypingIndicatorState createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Dot(animation: _animation, delay: 0.0),
            Dot(animation: _animation, delay: 0.2),
            Dot(animation: _animation, delay: 0.4),
          ],
        );
      },
    );
  }
}

class Dot extends StatelessWidget {
  final Animation<double> animation;
  final double delay;

  const Dot({Key? key, required this.animation, required this.delay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animation,
        curve: Interval(delay, delay + 0.6, curve: Curves.easeInOut),
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Container(
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.black, // Changed to black for better visibility
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
