import 'package:bharat_darshan/bottom_nav.dart';
import 'package:bharat_darshan/routes/router_const.dart';
import 'package:bharat_darshan/screens/parent_screens/favourite.dart';
import 'package:bharat_darshan/screens/child_screens/place_details.dart';
import 'package:bharat_darshan/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _minController = TextEditingController();
  final TextEditingController _maxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: LayoutBuilder(builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 20,
              right: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   user!.email!,
                  //   style: TextStyle(fontSize: 20),
                  // ),

                  // welcome back! -> 36 px
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // attractions
                      CategoryItem(
                          imagePath: 'assets/places/attraction.jpg',
                          label: 'Attractions'),
                      // dining
                      CategoryItem(
                          imagePath: 'assets/places/dining.jpg',
                          label: 'Dining'),
                      // activities
                      CategoryItem(
                          imagePath: 'assets/places/activity.jpg',
                          label: 'Activities'),
                      // Locales
                      CategoryItem(
                          imagePath: 'assets/places/local.jpg',
                          label: 'Locales'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Featured
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Featured',
                        style: TextStyle(
                          fontSize: 28,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          print('See all pressed');
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          "See all",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // number of items in each row
                      // mainAxisSpacing: 20.0, // spacing between rows
                      crossAxisSpacing: 8.0, // spacing between columns
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      final placeData = 2;
                      return InkWell(
                        onTap: () {
                          print(
                              "place data passed to open place details $placeData");
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PlaceDetails(),
                            ),
                          );
                        },
                        child: FeaturedItem(),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  // Places Near You
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Places Near You',
                        style: TextStyle(
                          fontSize: 28,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          print('See all pressed');
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          "See all",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, // number of items in each row
                      mainAxisSpacing: 8.0, // spacing between rows
                      crossAxisSpacing: 8.0, // spacing between columns
                      childAspectRatio: 1.5,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      final placeData = 2;
                      return InkWell(
                        onTap: () {
                          print(
                              "place data passed to open place details $placeData");
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PlaceDetails(),
                            ),
                          );
                        },
                        child: NearbyItem(),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  // Cities known for
                  Text(
                    'Cities known for',
                    style: TextStyle(
                      fontSize: 28,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // circle avatars
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // nightlife
                      CategoryItem(
                          imagePath: 'assets/places/nightlife.jpg',
                          label: 'Nightlife'),
                      // architecture
                      CategoryItem(
                          imagePath: 'assets/places/architecture.jpg',
                          label: 'Architecture'),
                      // history
                      CategoryItem(
                          imagePath: 'assets/places/history.jpg',
                          label: 'History'),
                      // outdoorsy
                      CategoryItem(
                          imagePath: 'assets/places/outdoorsy.jpg',
                          label: 'Outdoorsy'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Budget Planner
                  Text(
                    'Budget Planner',
                    style: TextStyle(
                      fontSize: 28,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),
                          Text(
                            "Set your budget to find affordable cities",
                            style: TextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 10),
                          // min, max
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // min
                                    SizedBox(
                                      width: screenWidth / 3,
                                      // height: 100,
                                      child: TextField(
                                        controller: _minController,
                                        decoration: InputDecoration(
                                          hintText: 'Min',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          contentPadding:
                                              const EdgeInsets.all(12),
                                          icon: Icon(
                                            Icons.currency_rupee,
                                            size: 20,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                          ),
                                          fillColor: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          filled: true,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    // max
                                    SizedBox(
                                      // height: 100,
                                      width: screenWidth / 3,
                                      child: TextField(
                                        controller: _maxController,
                                        decoration: InputDecoration(
                                          hintText: 'Max',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          contentPadding:
                                              const EdgeInsets.all(12),
                                          icon: Icon(
                                            Icons.currency_rupee,
                                            size: 20,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                          ),
                                          fillColor: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          filled: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // go button
                                ElevatedButton(
                                  onPressed: () {
                                    print("set budget");
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 20),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Go",
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      const SizedBox(width: 5),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Recent
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent',
                        style: TextStyle(
                          fontSize: 28,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          print('See all pressed');
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          "See all",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // number of items in each row
                      mainAxisSpacing: 8.0, // spacing between rows
                      crossAxisSpacing: 8.0, // spacing between columns
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      final placeData = 2;
                      return InkWell(
                        onTap: () {
                          print(
                              "place data passed to open place details $placeData");
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PlaceDetails(),
                            ),
                          );
                        },
                        child: FeaturedItem(),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

// Custom stateful widget for category item
class CategoryItem extends StatefulWidget {
  final String imagePath;
  final String label;

  const CategoryItem({
    super.key,
    required this.imagePath,
    required this.label,
  });

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("clicked ${widget.label}");
      },
      borderRadius: BorderRadius.circular(15),
      child: Column(
        children: [
          ClipOval(
            child: Container(
              color: Theme.of(context).primaryColor,
              // padding: const EdgeInsets.all(8),
              child: Image.asset(
                widget.imagePath,
                fit: BoxFit.contain,
                // height: 100,
              ),
            ),
          ),
          Text(
            widget.label,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

// Custom stateful widget for featured item
class FeaturedItem extends StatefulWidget {
  const FeaturedItem({super.key});

  @override
  State<FeaturedItem> createState() => _FeaturedItemState();
}

class _FeaturedItemState extends State<FeaturedItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
            image: AssetImage('assets/places/jaipur.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.6),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: _FeaturedItemContent(),
          ),
        ),
      ),
    );
  }
}

// Card(
//   child: Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(15),
//       image: DecorationImage(
//         image:
//             Image.asset('assets/places/jaipur.jpg').image,
//         fit: BoxFit.cover,
//       ),
//     ),
//     child: Container(
//       decoration: BoxDecoration(
//         color: Theme.of(context)
//             .primaryColor
//             .withOpacity(0.6),
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment:
//               MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // bookmark
//             Align(
//               alignment: Alignment.topRight,
//               child: IconButton(
//                 onPressed: () {
//                   print("bookmarked");
//                 },
//                 icon: Icon(
//                   Icons.bookmark_border_outlined,
//                   color: Theme.of(context)
//                       .scaffoldBackgroundColor,
//                   size: 25,
//                 ),
//               ),
//             ),
//             // city, state, rating
//             Column(
//               mainAxisAlignment:
//                   MainAxisAlignment.spaceAround,
//               crossAxisAlignment:
//                   CrossAxisAlignment.start,
//               children: [
//                 // city and icon
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(bottom: 3),
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.place,
//                         color: Theme.of(context)
//                             .scaffoldBackgroundColor,
//                       ),
//                       SizedBox(width: 3),
//                       Text(
//                         "Jaipur",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Theme.of(context)
//                               .scaffoldBackgroundColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // state
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8),
//                   child: Text(
//                     "Rajasthan",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Theme.of(context)
//                           .scaffoldBackgroundColor,
//                     ),
//                   ),
//                 ),
//                 // rating
//                 Padding(
//                   padding: const EdgeInsets.only(left: 3),
//                   child: Row(
//                     mainAxisAlignment:
//                         MainAxisAlignment.start,
//                     children: [
//                       const Icon(
//                         Icons.star,
//                         color: Colors.yellow,
//                         size: 18,
//                       ),
//                       const SizedBox(width: 5),
//                       Text(
//                         "4.2",
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Theme.of(context)
//                               .scaffoldBackgroundColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ),
//   ),
// );

class _FeaturedItemContent extends StatelessWidget {
  const _FeaturedItemContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // bookmark
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {
              print("bookmarked");
            },
            icon: Icon(
              Icons.bookmark_border_outlined,
              color: Theme.of(context).scaffoldBackgroundColor,
              size: 25,
            ),
          ),
        ),
        // city, state, rating
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // city and icon
            Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: Row(
                children: [
                  const Icon(
                    Icons.place,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    "Jaipur",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ],
              ),
            ),
            // state
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                "Rajasthan",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
            ),
            // rating
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 18,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "4.2",
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Custom stateful widget for nearby item
class NearbyItem extends StatefulWidget {
  const NearbyItem({super.key});

  @override
  State<NearbyItem> createState() => _NearbyItemState();
}

class _NearbyItemState extends State<NearbyItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
            image: AssetImage('assets/places/jaipur.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.6),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // bookmark
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      print("bookmarked");
                    },
                    icon: Icon(
                      Icons.bookmark_border_outlined,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      size: 30,
                    ),
                  ),
                ),
                // city, state, rating
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // city and icon
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.place,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              "Jaipur",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // state, rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // state
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "Rajasthan",
                              style: TextStyle(
                                fontSize: 18,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                            ),
                          ),
                          // rating
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 24,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "4.2",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//   Card(
                      //     child: Container(
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(15),
                      //         image: DecorationImage(
                      //           image:
                      //               Image.asset('assets/places/jaipur.jpg').image,
                      //           fit: BoxFit.cover,
                      //         ),
                      //       ),
                      //       child: Container(
                      //         decoration: BoxDecoration(
                      //           color: Theme.of(context)
                      //               .primaryColor
                      //               .withOpacity(0.6),
                      //           borderRadius: BorderRadius.circular(15),
                      //         ),
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Column(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               // bookmark
                      //               Align(
                      //                 alignment: Alignment.topRight,
                      //                 child: IconButton(
                      //                   onPressed: () {
                      //                     print("bookmarked");
                      //                   },
                      //                   icon: Icon(
                      //                     Icons.bookmark_border_outlined,
                      //                     color: Theme.of(context)
                      //                         .scaffoldBackgroundColor,
                      //                     size: 30,
                      //                   ),
                      //                 ),
                      //               ),
                      //               // city, state, rating
                      //               Padding(
                      //                 padding: const EdgeInsets.all(8.0),
                      //                 child: Column(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.spaceAround,
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                   children: [
                      //                     // city and icon
                      //                     Padding(
                      //                       padding:
                      //                           const EdgeInsets.only(bottom: 3),
                      //                       child: Row(
                      //                         children: [
                      //                           Icon(
                      //                             Icons.place,
                      //                             color: Theme.of(context)
                      //                                 .scaffoldBackgroundColor,
                      //                           ),
                      //                           SizedBox(width: 3),
                      //                           Text(
                      //                             "Jaipur",
                      //                             style: TextStyle(
                      //                               fontSize: 24,
                      //                               fontWeight: FontWeight.bold,
                      //                               color: Theme.of(context)
                      //                                   .scaffoldBackgroundColor,
                      //                             ),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     ),
                      //                     // state, rating
                      //                     Row(
                      //                       mainAxisAlignment:
                      //                           MainAxisAlignment.spaceBetween,
                      //                       children: [
                      //                         // state
                      //                         Padding(
                      //                           padding: const EdgeInsets.only(
                      //                               left: 8),
                      //                           child: Text(
                      //                             "Rajasthan",
                      //                             style: TextStyle(
                      //                               fontSize: 18,
                      //                               color: Theme.of(context)
                      //                                   .scaffoldBackgroundColor,
                      //                             ),
                      //                           ),
                      //                         ),
                      //                         // rating
                      //                         Padding(
                      //                           padding: const EdgeInsets.only(
                      //                               right: 8),
                      //                           child: Row(
                      //                             mainAxisAlignment:
                      //                                 MainAxisAlignment.start,
                      //                             children: [
                      //                               const Icon(
                      //                                 Icons.star,
                      //                                 color: Colors.yellow,
                      //                                 size: 24,
                      //                               ),
                      //                               const SizedBox(width: 5),
                      //                               Text(
                      //                                 "4.2",
                      //                                 style: TextStyle(
                      //                                   fontSize: 24,
                      //                                   color: Theme.of(context)
                      //                                       .scaffoldBackgroundColor,
                      //                                 ),
                      //                               ),
                      //                             ],
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   );