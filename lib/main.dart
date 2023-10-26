import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoog_flutter_crud/firebase_options.dart';
import 'package:zoog_flutter_crud/pages/signin_page.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: SignInPage(),
    );
  }
}
