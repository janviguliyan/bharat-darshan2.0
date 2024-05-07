import 'package:bharat_darshan/authenticate/create_account.dart';
import 'package:bharat_darshan/authenticate/login.dart';
import 'package:bharat_darshan/main.dart';
import 'package:bharat_darshan/routes/router_const.dart';
import 'package:bharat_darshan/screens/parent_screens/blogs.dart';
import 'package:bharat_darshan/screens/parent_screens/favourite.dart';
import 'package:bharat_darshan/screens/parent_screens/home.dart';
import 'package:bharat_darshan/screens/child_screens/place_details.dart';
import 'package:bharat_darshan/screens/parent_screens/search.dart';
import 'package:bharat_darshan/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bharat_darshan/bottom_nav.dart';
import 'package:go_router/go_router.dart';

class MyAppRouter {
  static final GlobalKey<NavigatorState> _rootNavigator =
      GlobalKey(debugLabel: 'root');
  static final GlobalKey<NavigatorState> _shellNavigator =
      GlobalKey(debugLabel: 'shell');

  final router = GoRouter(
    initialLocation: '/check',
    navigatorKey: _rootNavigator,
    routes: [
      // check -> /check
      GoRoute(
        path: '/check',
        builder: (context, state) {
          return SplashScreen();
          // return StreamBuilder<User?>(
          //   stream: FirebaseAuth.instance.authStateChanges(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //     if (snapshot.hasData) {
          //       // User is authenticated, navigate to home route
          //       return const BottomNavBar(
          //           // child: Home(),
          //           );
          //     } else {
          //       // User is not authenticated, navigate to login/signup route
          //       return const CreateAccount();
          //     }
          //   },
          // );
        },
      ),
      // login -> /
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginWidget(),
      ),
      // bottom nav -> /bottomnav
      GoRoute(
        path: '/bottomnav',
        builder: (context, state) => const BottomNavBar(),
      ),
      // home
      GoRoute(
        path: '/home',
        builder: (context, state) => const Home(),
      ),
      // fav
      GoRoute(
        path: '/fav',
        builder: (context, state) => const FavouritesScreen(),
      ),
      // search
      GoRoute(
        path: '/search',
        builder: (context, state) => const SearchScreen(),
      ),
      // blog
      GoRoute(
        path: '/blog',
        builder: (context, state) => const BlogScreen(),
      ),

      // ShellRoute(
      //   navigatorKey: _shellNavigator,
      //   builder: (context, state, child) {
      //     return Home(
      //       key: state.pageKey,
      //     );
      //   },
      //   routes: [
      //     GoRoute(
      //       path: '/placeDetails',
      //       pageBuilder: (context, state) {
      //         return NoTransitionPage(
      //           child: PlaceDetails(
      //             key: state.pageKey,
      //           ),
      //         );
      //       },
      //     ),
      //   ],
      // ),
    ],
  );
}
