import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Title"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Column(
            children: [
              const Text(
                "Profiles Screen",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              // logout button
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: const Text("Log out"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
