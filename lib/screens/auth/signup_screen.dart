// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice/screens/auth/login_screen.dart';
import 'package:practice/resources/auth_methods.dart';
import 'package:practice/utils/utils.dart';
import 'package:practice/widgets/buttons/my_button.dart';
import 'package:practice/widgets/text_boxes/my_text_field.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController first = TextEditingController();
  final TextEditingController last = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirm = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void dispose() {
    first.dispose();
    last.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  bool isLoading = false;

  final AuthMethods _authMethods = AuthMethods();

  signupUser(context) {
    setState(() {
      isLoading = true;
    });
    _authMethods.signupUser(
        context, first.text, last.text, email.text, password.text);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.gray600,
      body: SafeArea(
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
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
                        'Hello, Welcome to Re-Book!',
                        style: TextStyle(fontSize: 16, color: Colors.grey[400]),
                      ),
                      Utils().getSizedBox(25),
                      TextFields(
                        controller: first,
                        hint: 'First Name',
                        obscure: false,
                      ),
                      Utils().getSizedBox(10),
                      TextFields(
                        controller: last,
                        hint: 'Last Name',
                        obscure: false,
                      ),
                      Utils().getSizedBox(10),
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
                      TextFields(
                        controller: confirm,
                        hint: 'Confirm Password',
                        obscure: true,
                      ),
                      Utils().getSizedBox(10),
                      MyButton(
                        text: 'Sign Up',
                        tap: () {
                          if (password.text == confirm.text) {
                            signupUser(context);
                          } else {
                            return;
                          }
                        },
                      ),
                      Utils().getSizedBox(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already a member? ',
                            style: TextStyle(color: Vx.gray400),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(color: Colors.grey[400]),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
    );
  }
}
