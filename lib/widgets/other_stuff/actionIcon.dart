// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class ActionIcon extends StatefulWidget {
  final dynamic route;
  final IconData icon;
  final String length;
  const ActionIcon(
      {super.key,
      required this.icon,
      required this.route,
      required this.length});

  @override
  State<ActionIcon> createState() => _ActionIconState();
}

class _ActionIconState extends State<ActionIcon> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        InkWell(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => widget.route)),
          child: Icon(
            widget.icon,
            color: Colors.grey.shade200,
            size: 25,
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                  color: Vx.gray600, borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Text(
                  widget.length,
                  style: GoogleFonts.akshar(color: Colors.white, fontSize: 10),
                ),
              )),
        )
      ],
    );
  }
}
