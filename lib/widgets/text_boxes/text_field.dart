import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final bool price;
  final TextInputType keyboard;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.keyboard,
      this.price = false});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: widget.controller,
          keyboardType: widget.keyboard,
          decoration: InputDecoration(
            prefixIcon: widget.price ? const Icon(Icons.currency_rupee) : null,
            prefixIconColor: Colors.grey.shade900,
            label: Text(widget.hint),
            labelStyle: GoogleFonts.akshar(color: Colors.grey.shade600),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(20)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ),
    );
  }
}
