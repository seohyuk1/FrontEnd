import 'package:flutter/material.dart'; // JavaScript 세부 항목 위젯

class ChapterItem extends StatelessWidget {
  final double top;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const ChapterItem({
    super.key,
    required this.top,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: top,
          left: -1,
          child: GestureDetector(
            onTap: onTap,
            child: SizedBox(
              width: 298,
              height: 50,
              child: Stack(
                children: [
                  Positioned(
                    top: 12,
                    left: 63,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                        color: isSelected ? Color(0xFF6FAECC) : Color(0xFF222831),
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  if (isSelected)
                    Positioned(
                      top: 21,
                      left: 47,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFF6FAECC),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}