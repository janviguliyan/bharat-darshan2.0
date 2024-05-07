import 'package:bharat_darshan/bottom_nav.dart';
import 'package:bharat_darshan/screens/child_screens/place_details.dart';
import 'package:bharat_darshan/screens/parent_screens/home.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
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
                // search
                Text(
                  "Search",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 30),
                // search bar
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).primaryColor,
                      size: 25,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // places grid
                GridView.count(
                  crossAxisCount: 1,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  shrinkWrap: true,
                  childAspectRatio: 1.5,
                  scrollDirection: Axis.vertical,
                  physics: const PageScrollPhysics(),
                  children: List.generate(7, (index) {
                    final placeData = 2; // api json response here
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
                  }),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
