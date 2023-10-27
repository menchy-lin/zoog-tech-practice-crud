import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoog_flutter_crud/firebase_options.dart';
// import 'package:zoog_flutter_crud/pages/auth_page.dart';
import 'package:zoog_flutter_crud/pages/home_page.dart';
import 'package:zoog_flutter_crud/pages/signin_page.dart';
import 'package:zoog_flutter_crud/pages/signup_page.dart';
import 'package:zoog_flutter_crud/pages/users_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      initialRoute: '/signin',
      routes: {
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
        '/home': (context) => HomePage(),
        '/users': (context) => const UsersPage(),
      },
      // home: const AuthPage(),
    );
  }
}
