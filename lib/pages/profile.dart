import 'package:flutter/material.dart';
import 'package:genie/widgets/profile_container.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            ProfileContainer(
                title: 'Hello',
                onButtonPressed: () {},
                lotie: 'assets/splash.json')
          ],
        ),
      ),
    );
  }
}




// about us
// privacy and policy
// share app
// logout
