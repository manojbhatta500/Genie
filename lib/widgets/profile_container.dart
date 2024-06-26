import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProfileContainer extends StatelessWidget {
  ProfileContainer(
      {super.key,
      required this.title,
      required this.onButtonPressed,
      required this.lotie});

  late String title;
  late VoidCallback onButtonPressed;
  late String lotie;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onButtonPressed,
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 0.1 * width, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0XFF001C69).withOpacity(0.3),
              Color(0XFF001C69).withOpacity(0.5)
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            Spacer(),
            Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xFF00AAFF), width: 1),
                    borderRadius: BorderRadius.circular(8)),
                child: Lottie.asset(
                  lotie,
                )),
          ],
        ),
      ),
    );
  }
}
