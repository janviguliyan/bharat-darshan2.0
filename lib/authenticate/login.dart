import 'package:bharat_darshan/authenticate/auth_service.dart';
import 'package:bharat_darshan/screens/parent_screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:bharat_darshan/authenticate/create_account.dart';
import 'package:bharat_darshan/authenticate/forgotpass.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // email field
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            // password field
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            // Login buton
            ElevatedButton(
              onPressed: () async {
                // calling login function defined in auth_service.dart
                final message = await AuthService().login(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
                // checking status
                if (message!.contains('Success')) {
                  GoRouter.of(context).go('/bottomnav');
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const Home(),
                  // ),
                  // );
                  // context.go('/home');
                }
                // else condition
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );

                print(
                    'Email: ${_emailController.text}, Password: ${_passwordController.text}');
              },
              child: const Text('Login'),
            ),
            // const SizedBox(
            //   height: 30.0,
            // ),
            // GestureDetector(
            //   child: Text(
            //     "Forgot Password?",
            //     style: TextStyle(
            //       decoration: TextDecoration.underline,
            //       fontSize: 20,
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.of(context).push(
            //         MaterialPageRoute(builder: (context) => ForgotPass()));
            //   },
            // ),
            const SizedBox(
              height: 30.0,
            ),
            // Don't have an account? Create account
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CreateAccount(),
                  ),
                );
              },
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
