import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../utils/utils.dart';
import '../../widgets/buttons/my_button.dart';
import '../../widgets/text_boxes/my_text_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController repassword = TextEditingController();
  bool isLoading = false;
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
                    TextFields(
                      controller: email,
                      hint: 'Your E-mail',
                      obscure: false,
                    ),
                    Utils().getSizedBox(10),
                    TextFields(
                      controller: password,
                      hint: 'Old Password',
                      obscure: true,
                    ),
                    Utils().getSizedBox(10),
                    TextFields(
                      controller: repassword,
                      hint: 'New Password',
                      obscure: true,
                    ),
                    Utils().getSizedBox(25),
                    MyButton(
                      tap: () {
                        if (email.text.isNotEmpty ||
                            password.text.isNotEmpty ||
                            repassword.text.isNotEmpty) {
                          FirebaseAuth.instance
                              .sendPasswordResetEmail(email: email.text);
                        }
                        Utils().showSnackBar(
                            context, 'An email has been sent to $email');
                      },
                      text: ('Reset Password'),
                    ),
                  ],
                )),
    );
  }
}
