import 'package:bharat_darshan/authenticate/create_account.dart';
import 'package:bharat_darshan/routes/router_config.dart';
import 'package:bharat_darshan/screens/parent_screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:bharat_darshan/theme.dart';
import 'package:bharat_darshan/authenticate/login.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}
// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp
        // (
        .router(
      title: 'Flutter Demo',
      theme: themeData,
      routerConfig: MyAppRouter().router,
      // routeInformationProvider: MyAppRouter().router.routeInformationProvider,
      // routeInformationParser: MyAppRouter().router.routeInformationParser,
      // routerDelegate: MyAppRouter().router.routerDelegate,
      // home: const CheckStatus(),
    );
  }
}

class CheckStatus extends StatelessWidget {
  const CheckStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        // this checks if the user has already logged in then open Home() else open Login()
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator or splash screen while waiting for the auth state
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return const Home();
            // GoRouter.of(context).go('/home');
            // return Container(
            //   child: Center(child: Text("home")),
            // );
          } else {
            return const CreateAccount();
            // GoRouter.of(context).go('/login');
            // return Container(
            //   child: Center(child: Text("home")),
            // );
          }
        },
      ),
    );
  }
}

// class LoginStatic extends StatefulWidget {
//   const LoginStatic({super.key});

//   @override
//   State<LoginStatic> createState() => _LoginStaticState();
// }

// class _LoginStaticState extends State<LoginStatic> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             Text(
//               "data",
//               style: TextStyle(
//                   fontSize: 36, color: Theme.of(context).primaryColor),
//             ),
//             Text(
//               "data",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 28,
//               ),
//             ),
//             Text(
//               "data",
//               style: TextStyle(
//                 fontWeight: FontWeight.w900,
//                 fontSize: 20,
//               ),
//             ),
//             Text(
//               "data",
//               style: TextStyle(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 16,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
