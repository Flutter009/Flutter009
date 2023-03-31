import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../utils/utils.dart';
import '../../widgets/text_boxes/my_text_field.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController code = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: 'Forgot Password'.richText.make(),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: height * 0.3),
          height: height,
          width: width,
          color: Vx.gray600,
          child: VStack([
            'A mail has been sent to your email address'
                .richText
                .white
                .italic
                .make()
                .pOnly(left: 32, right: 32),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFields(
                  controller: code, hint: 'Enter the code', obscure: false),
            ),
            VStack(
              [
                InkWell(
                  onTap: () {
                    try {
                      FirebaseAuth.instance.confirmPasswordReset(
                          code: code.text, newPassword: newPassword.text);
                    } on FirebaseAuthException catch (e) {
                      Utils().showSnackBar(context, e.toString());
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Vx.black,
                        borderRadius: BorderRadius.circular(6)),
                    width: double.infinity,
                    child: Center(
                      child: 'Reset password'.richText.white.semiBold.make(),
                    ),
                  ),
                )
              ],
            ).h32(context).pOnly(left: 32, right: 32)
          ]),
        ),
      ),
    );
  }
}
