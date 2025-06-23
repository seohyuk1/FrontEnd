import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final List<Widget> children;

  const MainLayout({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 회색 배경
        Positioned(
          left: 220,
          top: -3,
          child: Container(
            width: 1190,
            height: 1300,
            color: const Color(0xFFEBEBEB),
          ),
        ),
        // 상단 네이비 박스
        Positioned(
          left: 220,
          top: 20,
          child: Container(
            width: 1190,
            height: 125,
            color: const Color(0xFF222831),
          ),
        ),
        const Positioned(
          left: 247,
          top: 27,
          child: Text(
            'Community',
            style: TextStyle(
              fontSize: 44,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
        const Positioned(
          left: 247,
          top: 100,
          child: Text(
            '질문을 올리고 정보를 나누어 보세요.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        // 자식 위젯들
        ...children,
      ],
    );
  }
}