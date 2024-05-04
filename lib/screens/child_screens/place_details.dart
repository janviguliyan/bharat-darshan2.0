import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PlaceDetails extends StatefulWidget {
  const PlaceDetails({super.key});

  @override
  State<PlaceDetails> createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "This is place details",
              style: TextStyle(
                fontSize: 36,
                color: Theme.of(context).primaryColor,
              ),
            ),
            ElevatedButton(
              onPressed: () => GoRouter.of(context).go('/home'),
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => Home())),
              // context.go("/home"),
              child: const Text("Go to home page"),
            ),
          ],
        ),
      ),
    );
  }
}
