import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Filters extends StatelessWidget {
  final String label;
  final IconData icon;
  const Filters({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                label,
                style: GoogleFonts.akshar(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
                size: 14,
              ),
            )
          ],
        )
      ],
    );
  }
}
