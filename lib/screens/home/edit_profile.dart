import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/utils/utils.dart';
import 'package:practice/widgets/buttons/my_button.dart';
import 'package:practice/widgets/text_boxes/text_form_field.dart';
import 'package:velocity_x/velocity_x.dart';

class EditProfile extends StatefulWidget {
  final String first;
  final String last;
  final String email;
  const EditProfile(
      {super.key,
      required this.first,
      required this.last,
      required this.email});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
//   final TextEditingController first = TextEditingController();
//   final TextEditingController email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final uid = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    String first = widget.first;
    String last = widget.last;
    String email = widget.email;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Vx.black,
        title: 'Edit Profile'.text.white.make(),
      ),
      backgroundColor: Vx.gray800,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: MyTextFormField(
                  value: widget.first,
                  onSave: (value) {
                    setState(() {
                      first = value!;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: MyTextFormField(
                  value: widget.last,
                  onSave: (value) {
                    setState(() {
                      last = value!;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: MyTextFormField(
                  value: widget.email,
                  onSave: (value) {
                    setState(() {
                      email = value!;
                    });
                  },
                ),
              ),
              10.heightBox,
              MyButton(
                  text: 'Update',
                  tap: () {
                    try {
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(uid)
                          .update(
                              {'email': email, 'first': first, 'last': last});
                    } catch (e) {
                      Utils().showToast(e.toString());
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
