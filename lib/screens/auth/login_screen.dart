// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:practice/screens/auth/forgot_password.dart';
import 'package:practice/screens/auth/signup_screen.dart';
import 'package:practice/resources/auth_methods.dart';
import 'package:practice/utils/utils.dart';
import 'package:practice/widgets/buttons/my_button.dart';
import 'package:practice/widgets/text_boxes/my_text_field.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool isLoading = false;
  void signinUser() async {
    setState(() {
      isLoading = true;
    });
    AuthMethods().signinUser(context, email.text, password.text);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.gray600,
      body: SafeArea(
          child: isLoading
              ? Container(
                  color: Colors.black,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                )
              : Column(
                  children: [
                    Utils().getSizedBox(50),
                    const Center(
                      child: Icon(
                        Icons.lock,
                        size: 100,
                      ),
                    ),
                    Utils().getSizedBox(50),
                    Text(
                      'Welcome back, You\'ve been missed!',
                      style: TextStyle(fontSize: 16, color: Colors.grey[400]),
                    ),
                    Utils().getSizedBox(25),
                    TextFields(
                      controller: email,
                      hint: 'E-mail',
                      obscure: false,
                    ),
                    Utils().getSizedBox(10),
                    TextFields(
                      controller: password,
                      hint: 'Password',
                      obscure: true,
                    ),
                    Utils().getSizedBox(10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgotPassword()));
                            },
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(color: Colors.grey[400]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Utils().getSizedBox(25),
                    MyButton(
                      tap: () {
                        signinUser();
                      },
                      text: ('Sign in'),
                    ),
                    Utils().getSizedBox(10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Not a member yet? ',
                            style: TextStyle(color: Vx.gray400),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen()));
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.grey[200]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
    );
  }
}
