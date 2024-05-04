import 'package:bharat_darshan/authenticate/create_account.dart';
import 'package:bharat_darshan/bottom_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // allows us to use duration and animation, etc

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 3), () {
      _navigateBasedOnAuthState(context);
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
    });
    // the bottom and top bars disappear
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    // bottom and top bars can be controlled manually
    super.dispose();
  }

  void _navigateBasedOnAuthState(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        // User is authenticated, navigate to home route
        context.go('/bottomnav');
      } else {
        // User is not authenticated, navigate to login/signup route
        context.go('/');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        width: double.infinity,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset('assets/bg_top.svg'),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SvgPicture.asset('assets/bg_bottom.svg'),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset('assets/bg_logo.svg')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
