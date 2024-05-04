import 'package:bharat_darshan/authenticate/auth_service.dart';
import 'package:bharat_darshan/screens/parent_screens/home.dart';
import 'package:flutter/material.dart';

import 'package:bharat_darshan/authenticate/login.dart';
import 'package:go_router/go_router.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // bool isLogin = true;

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
            // create account button
            ElevatedButton(
              onPressed: () async {
                // calling registration function from auth_service.dart
                final message = await AuthService().registration(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
                // checking result
                if (message!.contains('Success')) {
                  context.go('/bottomnav');
                  // Navigator.of(context).pushReplacement(
                  //     MaterialPageRoute(builder: (context) => const Home()));
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
              child: const Text('Create Account'),
            ),
            const SizedBox(
              height: 30.0,
            ),
            // Already have an account? Sign in.
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginWidget(),
                  ),
                );
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
