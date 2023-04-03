import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTextFormField extends StatefulWidget {
  final String value;
  final void Function(String?)? onSave;
  const MyTextFormField({super.key, required this.value, required this.onSave});

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: const TextStyle(color: Vx.white),
        initialValue: widget.value,
        onSaved: widget.onSave,
        // controller: first,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(20)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(20)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
