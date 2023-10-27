import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zoog_flutter_crud/pages/home_page.dart';
import 'package:zoog_flutter_crud/pages/signin_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            debugPrint('User is signed in!');
            return HomePage();
          } else {
            debugPrint('User is currently signed out!');
            return const SignInPage();
          }
        },
      ),
    );
  }
}
