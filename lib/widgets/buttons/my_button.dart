import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyButton extends StatefulWidget {
  final String text;
  final Function()? tap;
  const MyButton({super.key, required this.text, required this.tap});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.tap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: Vx.black, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
