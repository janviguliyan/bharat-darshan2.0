import 'package:bharat_darshan/screens/child_screens/profile.dart';
import 'package:bharat_darshan/screens/parent_screens/blogs.dart';
import 'package:bharat_darshan/screens/parent_screens/favourite.dart';
import 'package:bharat_darshan/screens/parent_screens/home.dart';
import 'package:bharat_darshan/screens/parent_screens/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
// import 'package:auto_route/auto_route.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar(
      {
      // required this.child,
      super.key});

  // final Widget child;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var _currentIndex = 1;

  void _currentPage(int index) {
    print("index: $index");
    setState(() {
      _currentIndex = index;
    });
    print("index: $index");
  }

  @override
  Widget build(BuildContext context) {
    // this is the current page visible by default
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    Widget activePage = const Home();

    // when tapped on bottom nav-> index changed-> widget rebuilt->
    // switch case executes and corresponding page set to active page
    // which is loaded in the body of scaffold widget
    switch (_currentIndex) {
      case 0:
        activePage = const BlogScreen();
        break;
      case 1:
        activePage = const Home();
        break;
      case 2:
        activePage = const SearchScreen();
        break;
      case 3:
        activePage = const FavouritesScreen();
        break;
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'assets/logo.svg',
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    print("push notification pressed");
                  },
                  icon: Icon(
                    Icons.notifications,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  icon: Icon(
                    Icons.person,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // top
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset('assets/bg_top2.svg'),
          ),
          // middle left
          // Align(
          //   alignment: Alignment.centerLeft,
          //   child: SvgPicture.asset('assets/bg_ml.svg'),
          // ),
          // // middle right
          // Align(
          //   alignment: Alignment.centerRight,
          //   child: SvgPicture.asset('assets/bg_mr.svg'),
          // ),
          // // bottom
          Align(
            alignment: Alignment.bottomLeft,
            child: SvgPicture.asset('assets/bg_bottom2.svg'),
          ),
          activePage,
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _currentIndex,
        onTap: _currentPage,
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.newspaper),
            title: Text("Blogs"),
            selectedColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            selectedColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favorites"),
            selectedColor: Theme.of(context).scaffoldBackgroundColor,
          ),
        ],
      ),
    );
  }
}
