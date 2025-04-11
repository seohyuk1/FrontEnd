import 'package:flutter/material.dart';

class SelectedMenuBackground extends StatelessWidget {
  final double top;

  const SelectedMenuBackground({super.key, required this.top});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: top,
      child: Container(
        width: 235,
        height: 48,
        decoration: const BoxDecoration(
          color: Color(0xFF222831),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}