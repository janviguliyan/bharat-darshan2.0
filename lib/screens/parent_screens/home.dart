import 'package:bharat_darshan/bottom_nav.dart';
import 'package:bharat_darshan/routes/router_const.dart';
import 'package:bharat_darshan/screens/parent_screens/favourite.dart';
import 'package:bharat_darshan/screens/child_screens/place_details.dart';
import 'package:bharat_darshan/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   user!.email!,
              //   style: TextStyle(fontSize: 20),
              // ),

              // welcome back!
              Text(
                'Welcome back!',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 20),
              // circle avatars
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // attractions
                  InkWell(
                    onTap: () {
                      print("clicked attractions");
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Column(
                      children: [
                        ClipOval(
                          child: Container(
                            color: Theme.of(context).primaryColor,
                            // height: 100,
                            child: Image.asset(
                              'assets/places/attraction.jpg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Text(
                          "Attractions",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  // dining
                  InkWell(
                    onTap: () {
                      print("clicked dining");
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Column(
                      children: [
                        ClipOval(
                          child: Container(
                            color: Theme.of(context).primaryColor,
                            // height: 100,
                            child: Image.asset(
                              'assets/places/dining.jpg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Text(
                          "Dining",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  // activities
                  InkWell(
                    onTap: () {
                      print("clicked activities");
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Column(
                      children: [
                        ClipOval(
                          child: Container(
                            color: Theme.of(context).primaryColor,
                            // height: 100,
                            child: Image.asset(
                              'assets/places/activity.jpg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Text(
                          "Activities",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  // Locales
                  InkWell(
                    onTap: () {
                      print("clicked locales");
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Column(
                      children: [
                        ClipOval(
                          child: Container(
                            color: Theme.of(context).primaryColor,
                            // height: 100,
                            child: Image.asset(
                              'assets/places/local.jpg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Text(
                          "Locales",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Featured

              // place details
              ElevatedButton(
                onPressed: () {
                  print('fav clicked');
                  // context.go('/placeDetails');
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const PlaceDetails()),
                  );
                },
                child: Text("place details"),
              ),
              const SizedBox(
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
    // Scaffold(
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text(
    //           "Signed in!",
    //           style: TextStyle(
    //             fontSize: 36,
    //             color: Theme.of(context).primaryColor,
    //           ),
    //         ),
    //         Text(
    //           user!.email!,
    //           style: TextStyle(fontSize: 20),
    //         ),
    //         // fav button
    //         ElevatedButton(
    //           onPressed: () => GoRouter.of(context).go('/fav'),
    //           // Navigator.of(context).push(
    //           //     MaterialPageRoute(builder: (context) => FavouritesScreen())),
    //           // context.go('/fav'),
    //           child: Text("Fav"),
    //         ),
    //         // {
    //         // context.goNamed(MyAppRouteConstants.placeDetailsgRoute);
    //         // Navigator.of(context).push(
    //         //   MaterialPageRoute(builder: (context) => const PlaceDetails()),
    //         // );
    //         // },
    //         SizedBox(
    //           height: 20,
    //         ),
    //         ElevatedButton(
    //           onPressed: () {
    //             // GoRouter.of(context).pushNamed(MyAppRouteConstants.favRoute);
    //             // GoRouter.of(context).pushNamed(MyAppRouteConstants.favRoute);
    //             // context.go("/favourite");
    //             print('fav clicked');

    //             // Navigator.of(context).push(
    //             //   MaterialPageRoute(builder: (context) => const PlaceDetails()),
    //             // );
    //           },
    //           child: Text("favourite"),
    //         ),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         // logout button
    //         ElevatedButton(
    //           onPressed: () {
    //             FirebaseAuth.instance.signOut();
    //           },
    //           child: Text("Log out"),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
