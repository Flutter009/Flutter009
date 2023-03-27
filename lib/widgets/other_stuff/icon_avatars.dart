import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconAvatar extends StatefulWidget {
  final String label;
  final IconData icon;
  const IconAvatar({super.key, required this.label, required this.icon});

  @override
  State<IconAvatar> createState() => _IconAvatarState();
}

class _IconAvatarState extends State<IconAvatar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              widget.icon,
              color: Colors.white,
              size: 23,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
            width: 40,
            child: Text(
              widget.label,
              style: GoogleFonts.akshar(color: Colors.white, fontSize: 10),
            ),
          ),
        )
      ],
    );
  }
}
