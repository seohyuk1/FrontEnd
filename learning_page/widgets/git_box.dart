import 'package:flutter/material.dart';

class GitCard extends StatelessWidget {
  final double top;
  final bool isExpanded;
  final VoidCallback onToggle;

  const GitCard({
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
        // 카드 배경
        Positioned(
          left: 300,
          top: top,
          child: Container(
            width: 1000,
            height: isExpanded ? 340 : 240,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: const Color(0xFF222831), width: 1.5),
            ),
          ),
        ),
        // 제목
        Positioned(
          left: 360,
          top: top + 18,
          child: const Text(
            'Git',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700, color: Color(0xFF222831)),
          ),
        ),
        // 현재 학습 단원
        Positioned(
          left: 650,
          top: top + 55,
          child: const Text('현재 학습중인 단원명',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF8D8D8D))),
        ),
        Positioned(
          left: 850,
          top: top + 55,
          child: const Text('Chapter 2. CSS',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF393E46))),
        ),
        // 마지막 학습
        Positioned(
          left: 650,
          top: top + 90,
          child: const Text('마지막 진행한 학습',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF8D8D8D))),
        ),
        Positioned(
          left: 850,
          top: top + 90,
          child: const Text('이미지 및 미디어 삽입',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF393E46))),
        ),
        Positioned(
          left: 1170,
          top: top + 94,
          child: const Text('이어하기',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF6FAECC))),
        ),
        // 진행도 바 테두리
        Positioned(
          left: 360,
          top: top + 135,
          child: Container(
            width: 880,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black),
            ),
          ),
        ),
        // 진행도 채우기
        Positioned(
          left: 363,
          top: top + 138,
          child: Container(
            width: 340,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF6FAECC),
            ),
          ),
        ),
        // 라벨들
        Positioned(
          left: 500,
          top: top + 173,
          child: const Text('html', style: labelStyle),
        ),
        Positioned(
          left: 670,
          top: top + 173,
          child: const Text('css', style: labelStyle),
        ),
        Positioned(
          left: 840,
          top: top + 173,
          child: const Text('js', style: labelStyle),
        ),
        Positioned(
          left: 1000,
          top: top + 173,
          child: const Text('react', style: labelStyle),
        ),
        Positioned(
          left: 1210,
          top: top + 173,
          child: const Text('git', style: labelStyle),
        ),
        // 펼치기 버튼
        Positioned(
          left: 1250,
          top: top + 195,
          child: GestureDetector(
            onTap: onToggle,
            child: Icon(isExpanded ? Icons.expand_less : Icons.expand_more, size: 48),
          ),
        ),
        // 확장된 내용
        if (isExpanded)
          Positioned(
            left: 360,
            top: top + 255,
            child: const Text(
              '세부내용: Git 학습 요약, 커밋/푸시 예제 등을 추가할 수 있습니다.',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
      ],
    );
  }
}