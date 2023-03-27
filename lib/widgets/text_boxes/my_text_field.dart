import 'package:flutter/material.dart';

class TextFields extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboard;
  final bool obscure;
  final String hint;
  const TextFields(
      {super.key,
      required this.controller,
      required this.hint,
      this.keyboard = TextInputType.text,
      required this.obscure});

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscure,
        keyboardType: widget.keyboard,
        decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyle(color: Colors.grey[500]),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            fillColor: Colors.grey.shade200,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400))),
      ),
    );
  }
}
