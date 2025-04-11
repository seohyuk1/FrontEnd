import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';

void main() => runApp(LearningMain());

class LearningMain extends StatefulWidget {
  @override
  State<LearningMain> createState() => _LearningMainState();
}

class _LearningMainState extends State<LearningMain> {
  bool _isFirstExpanded = false;
  bool _isSecondExpanded = false;

  void _toggleFirstCardExpand() {
    setState(() {
      _isFirstExpanded = !_isFirstExpanded;
    });
  }

  void _toggleSecondCardExpand() {
    setState(() {
      _isSecondExpanded = !_isSecondExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Graduate',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            const Sidebar(),
            Transform.translate(
              offset: const Offset(32, 0),
              child: Stack(
                children: [
                  Positioned(
                    left: 220,
                    top: -3,
                    child: Container(
                      width: 1190,
                      height: 1300,
                      color: const Color(0xFFEBEBEB),
                    ),
                  ),
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
                      'Study',
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
                      '대충 중간 소개글',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  StudyCard(
                    top: 180,
                    isExpanded: _isFirstExpanded,
                    onToggle: _toggleFirstCardExpand,
                    title: 'Node.js',
                    progressWidth: 500,
                    labels: ['JS', 'DOM', 'Node JS'],
                    labelPositions: [550, 850, 1170],
                    currentChapter: 'DOM',
                    lastLesson: '폼과 입력 처리',
                  ),
                  StudyCard(
                    top: _isFirstExpanded ? 540 : 440,
                    isExpanded: _isSecondExpanded,
                    onToggle: _toggleSecondCardExpand,
                    title: 'Git',
                    progressWidth: 340,
                    labels: ['html', 'css', 'js', 'react', 'git'],
                    labelPositions: [500, 670, 840, 1000, 1210],
                    currentChapter: 'Chapter 2. CSS',
                    lastLesson: '이미지 및 미디어 삽입',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StudyCard extends StatefulWidget {
  final double top;
  final String title;
  final double progressWidth;
  final List<String> labels;
  final List<double> labelPositions;
  final String currentChapter;
  final String lastLesson;
  final bool isExpanded;
  final VoidCallback? onToggle;

  const StudyCard({
    super.key,
    required this.top,
    required this.title,
    required this.progressWidth,
    required this.labels,
    required this.labelPositions,
    required this.currentChapter,
    required this.lastLesson,
    this.isExpanded = false,
    this.onToggle,
  });

  @override
  State<StudyCard> createState() => _StudyCardState();
}

class _StudyCardState extends State<StudyCard> {
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
          top: widget.top,
          child: Container(
            width: 1000,
            height: widget.isExpanded ? 320 : 220,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: const Color(0xFF222831), width: 1.5),
            ),
          ),
        ),
        Positioned(
          left: 360,
          top: widget.top + 18,
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: Color(0xFF222831),
            ),
          ),
        ),
        Positioned(
          left: 650,
          top: widget.top + 35,
          child: const Text('현재 학습중인 단원명',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF8D8D8D))),
        ),
        Positioned(
          left: 850,
          top: widget.top + 35,
          child: Text(widget.currentChapter,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF393E46))),
        ),
        Positioned(
          left: 650,
          top: widget.top + 70,
          child: const Text('마지막 진행한 학습',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF8D8D8D))),
        ),
        Positioned(
          left: 850,
          top: widget.top + 70,
          child: Text(widget.lastLesson,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF393E46))),
        ),
        Positioned(
          left: 1170,
          top: widget.top + 74,
          child: const Text('이어하기',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF6FAECC))),
        ),
        Positioned(
          left: 360,
          top: widget.top + 115,
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
          top: widget.top + 118,
          child: Container(
            width: widget.progressWidth,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF6FAECC),
            ),
          ),
        ),
        for (int i = 0; i < widget.labels.length; i++)
          Positioned(
            left: widget.labelPositions[i],
            top: widget.top + 149,
            child: Text(widget.labels[i], style: labelStyle),
          ),
        Positioned(
          left: 1250,
          top: widget.top + 170,
          child: GestureDetector(
            onTap: widget.onToggle,
            child: Icon(
              widget.isExpanded ? Icons.expand_less : Icons.expand_more,
              size: 48,
            ),
          ),
        ),
        if (widget.isExpanded)
          Positioned(
            left: 360,
            top: widget.top + 230,
            child: const Text(
              '세부내용: 여기에 강의 설명이나 노트를 표시할 수 있습니다.',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
      ],
    );
  }
}