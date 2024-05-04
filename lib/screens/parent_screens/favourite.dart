import 'package:bharat_darshan/bottom_nav.dart';
import 'package:bharat_darshan/screens/parent_screens/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Favourite screen",
              style: TextStyle(
                fontSize: 36,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
