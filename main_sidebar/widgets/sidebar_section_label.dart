import 'package:flutter/material.dart';

class SidebarSectionLabel extends StatelessWidget {
  final String title;

  const SidebarSectionLabel({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: const Color(0xFF393E46),
            fontFamily: 'NotoSansKr-Bold',
            fontSize: 13,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.0,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}