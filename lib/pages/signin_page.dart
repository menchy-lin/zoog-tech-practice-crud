import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zoog_flutter_crud/components/custom_button.dart';
import 'package:zoog_flutter_crud/components/custom_square_tile.dart';
import 'package:zoog_flutter_crud/components/custom_textfield.dart';
import 'package:zoog_flutter_crud/firebase_auth/firebase_auth_service.dart';
import 'package:zoog_flutter_crud/pages/signup_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  // Text editing controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Method - sign in
  void signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Show loading circle
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    // );

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      print('User is successfully signed in!');
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      print('Some error occurred!');
    }
    // try {
    //   await FirebaseAuth.instance
    //       .signInWithEmailAndPassword(email: email, password: password);

    //   // Remove CircularProgressIndicator() when user successfully signed in
    //   // Navigator.pop(context);
    // } on FirebaseAuthException catch (e) {
    //   // Remove CircularProgressIndicator() when user failed to signed in
    //   // Navigator.pop(context);

    //   if (e.code == 'user-not-found' || e.code == 'wrong-password') {
    //     // wrongEmailMessage();
    //     print('Invalid email or password');
    //   } else {
    //     print('An error occurred ${e.code}');
    //     // wrongPasswordMessage();
    //   }
    // }
  }

  // Method - wrong email alert dialog
  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (builder) {
        return const AlertDialog(
          title: Text('Wrong Email'),
        );
      },
    );
  }

  // Method - wrong email alert dialog
  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (builder) {
        return const AlertDialog(
          title: Text('Wrong Password'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 36, 182, 136),
                Color.fromARGB(255, 132, 18, 219),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 40),
                  Container(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Image.asset('lib/assets/images/flutter.png')),
                  const SizedBox(height: 40),
                  const Text(
                    'Welcome to the Flutter!',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                      controller: _emailController,
                      hintText: 'Email',
                      obscureText: false),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      obscureText: true),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    onTap: () => signIn(),
                    text: ('Sign In'),
                  ),
                  const SizedBox(height: 35),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 35),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // google button
                      CustomSquareTile(
                          imagePath: 'lib/assets/images/google.png'),

                      SizedBox(width: 25),

                      // facebook button
                      CustomSquareTile(imagePath: 'lib/assets/images/fb.png')
                    ],
                  ),
                  const SizedBox(height: 25),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'No account yet?',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        GestureDetector(
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                                fontWeight: FontWeight.w900),
                          ),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpPage(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
