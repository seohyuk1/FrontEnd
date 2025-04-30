// lib/widgets/nodejs_box.dart
import 'package:flutter/material.dart';

class NodeJsCard extends StatelessWidget {
  final double top;
  final bool isExpanded;
  final VoidCallback onToggle;

  const NodeJsCard({
    super.key,
    required this.top,
    required this.isExpanded,
    required this.onToggle,
  });

  static const TextStyle labelStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Color(0xFF8D8D8D),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 300,
          top: top,
          child: Container(
            width: 1000,
            height: isExpanded ? 320 : 220,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: const Color(0xFF222831), width: 1.5),
            ),
          ),
        ),
        Positioned(
          left: 360,
          top: top + 18,
          child: const Text(
            'Node.js',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700, color: Color(0xFF222831)),
          ),
        ),
        Positioned(
          left: 650,
          top: top + 35,
          child: const Text('현재 학습중인 단원명',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF8D8D8D))),
        ),
        const Positioned(
          left: 850,
          top: 215, // top + 35 + top = 180 + 35
          child: Text('DOM',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF393E46))),
        ),
        Positioned(
          left: 650,
          top: top + 70,
          child: const Text('마지막 진행한 학습',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF8D8D8D))),
        ),
        const Positioned(
          left: 850,
          top: 250,
          child: Text('폼과 입력 처리',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF393E46))),
        ),
        Positioned(
          left: 1170,
          top: top + 74,
          child: const Text('이어하기',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF6FAECC))),
        ),
        Positioned(
          left: 360,
          top: top + 115,
          child: Container(
            width: 880,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black),
            ),
          ),
        ),
        Positioned(
          left: 363,
          top: top + 118,
          child: Container(
            width: 500,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF6FAECC),
            ),
          ),
        ),
        const Positioned(
          left: 550,
          top: 329,
          child: Text('JS', style: labelStyle),
        ),
        const Positioned(
          left: 850,
          top: 329,
          child: Text('DOM', style: labelStyle),
        ),
        const Positioned(
          left: 1170,
          top: 329,
          child: Text('Node JS', style: labelStyle),
        ),
        Positioned(
          left: 1250,
          top: top + 170,
          child: GestureDetector(
            onTap: onToggle,
            child: Icon(isExpanded ? Icons.expand_less : Icons.expand_more, size: 48),
          ),
        ),
        if (isExpanded)
          Positioned(
            left: 360,
            top: top + 230,
            child: const Text(
              '세부내용: 여기에 강의 설명이나 노트를 표시할 수 있습니다.',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
      ],
    );
  }
}
