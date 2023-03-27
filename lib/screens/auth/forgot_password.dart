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
  final TextEditingController code = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
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
                        controller: email, hint: 'Your E-mail', obscure: false),
                    Utils().getSizedBox(25),
                    MyButton(
                      tap: () {
                        if (email.text.isNotEmpty) {
                          FirebaseAuth.instance
                              .sendPasswordResetEmail(email: email.text);
                        }
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                icon: const Icon(Icons.password),
                                title: 'A mail has been sent to $email.value'
                                    .richText
                                    .italic
                                    .make(),
                                content: TextFields(
                                    controller: code,
                                    hint: 'Enter the code',
                                    obscure: false),
                                actions: [
                                  InkWell(
                                    onTap: () {
                                      try {
                                        FirebaseAuth.instance
                                            .confirmPasswordReset(
                                                code: code.text,
                                                newPassword: newPassword.text);
                                      } on FirebaseAuthException catch (e) {
                                        Utils().showSnackBar(
                                            context, e.toString());
                                      }
                                    },
                                    child: Container(
                                      color: Vx.black,
                                      width: double.infinity,
                                      child: Center(
                                        child: 'Reset password'
                                            .richText
                                            .semiBold
                                            .make(),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            });
                      },
                      text: ('Reset Password'),
                    ),
                  ],
                )),
    );
  }
}
