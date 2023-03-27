import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SortOption extends StatefulWidget {
  final String sort;
  final VoidCallback tap;
  const SortOption({super.key, required this.sort, required this.tap});

  @override
  State<SortOption> createState() => _SortOptionState();
}

class _SortOptionState extends State<SortOption> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Vx.black.withOpacity(0.6),
        ),
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        child: InkWell(
          onTap: widget.tap,
          child: VxBox(
            child: widget.sort.richText.white.make().pOnly(left: 8),
          ).make().p4(),
        ),
      ),
    );
  }
}
