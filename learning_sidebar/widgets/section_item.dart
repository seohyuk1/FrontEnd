import 'package:flutter/material.dart';

class SectionItem extends StatelessWidget {
  final double top;
  final String title;
  final bool expanded;
  final bool selected;
  final VoidCallback onTap;

  const SectionItem({
    super.key,
    required this.top,
    required this.title,
    required this.expanded,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: top,
          left: -1,
          child: Container(
            width: 298,
            height: 60,
            decoration: const BoxDecoration(
              color: Color(0xFFEBEBEB),
              border: Border(
                right: BorderSide(width: 1, color: Color(0xFF222831)),
              ),
            ),
          ),
        ),
        Positioned(
          top: top + 17,
          left: 23,
          child: GestureDetector(
            onTap: onTap,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: selected ? const Color(0xFF6FAECC) : const Color(0xFF222831),
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
        Positioned(
          top: top + 19,
          left: 257,
          child: GestureDetector(
            onTap: onTap,
            child: Icon(
              expanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
              size: 24,
            ),
          ),
        ),
        Positioned(
          top: top + 60,
          left: 15,
          child: SizedBox(
            width: 265,
            child: const Divider(thickness: 2, height: 0, color: Color(0xFF222831)),
          ),
        ),
        if (expanded)
          Positioned(
            top: top + 70,
            left: 23,
            child: Text(
              '$title 내용입니다.',
              style: const TextStyle(fontSize: 14, color: Colors.black, decoration: TextDecoration.none),
            ),
          ),
      ],
    );
  }
}