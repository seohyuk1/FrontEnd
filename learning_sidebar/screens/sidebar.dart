import 'package:flutter/material.dart';
import '../widgets/chapter_item.dart';
import '../widgets/section_item.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  bool isJsExpanded = false;
  String selectedChapter = '화살표 함수';
  String selectedMain = '';

  final Map<String, bool> sectionExpanded = {
    'DOM': false,
    '비동기 처리': false,
    'JavaScript 고급 개념': false,
    'Node.js와 서버 개발': false,
  };

  @override
  Widget build(BuildContext context) {
    double jsOffset = isJsExpanded ? 250 : 0;

    return SizedBox(
      width: 300,
      height: 1024,
      child: Stack(
        children: [
          // 회색 배경 + 오른쪽 선
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 298,
              height: 1024,
              decoration: const BoxDecoration(
                color: Color(0xFFEBEBEB),
                border: Border(
                  right: BorderSide(width: 2, color: Color(0xFF222831)),
                ),
              ),
            ),
          ),

          // 헤더 배경 + 오른쪽 선
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 298,
              height: 184,
              decoration: const BoxDecoration(
                color: Color(0xFFEBEBEB),
                border: Border(
                  right: BorderSide(width: 2, color: Color(0xFF222831)),
                ),
              ),
            ),
          ),

          // JavaScript 위 회색 구분선
          Positioned(
            top: 190,
            child: SizedBox(
              width: 296,
              child: Divider(
                color: Color(0xFFC5C3C3),
                thickness: 1,
                height: 1,
              ),
            ),
          ),

          // 타이틀
          Positioned(
            top: 45.79,
            left: 0,
            child: SizedBox(
              width: 300,
              child: Text(
                'Node.js',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF222831),
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),

          // 진행도 바
          Positioned(
            top: 110,
            left: 32,
            child: Container(
              width: 159,
              height: 9,
              decoration: BoxDecoration(
                color: const Color(0xFF6FAECC),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Positioned(
            top: 109,
            left: 31,
            child: Container(
              width: 244,
              height: 11,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Positioned(
            top: 122.5,
            left: 181,
            child: SizedBox(
              width: 94.16,
              child: Text(
                '진행도 : 60%',
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF222831),
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),

          // JavaScript 메인 카테고리
          Positioned(
            top: 210,
            left: 23,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isJsExpanded = !isJsExpanded;
                  selectedMain = 'JavaScript';
                  sectionExpanded.updateAll((key, value) => false);
                });
              },
              child: Text(
                'JavaScript',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: selectedMain == 'JavaScript'
                      ? const Color(0xFF6FAECC)
                      : const Color(0xFF222831),
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
          Positioned(
            top: 212,
            left: 257,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isJsExpanded = !isJsExpanded;
                  selectedMain = 'JavaScript';
                  sectionExpanded.updateAll((key, value) => false);
                });
              },
              child: Icon(
                isJsExpanded
                    ? Icons.keyboard_arrow_down
                    : Icons.keyboard_arrow_right,
                size: 24,
              ),
            ),
          ),

          // JavaScript 하위 구분선
          Positioned(
            top: 250,
            left: 15,
            child: SizedBox(
              width: 265,
              child: Divider(
                thickness: 2,
                height: 0,
                color: const Color(0xFF222831),
              ),
            ),
          ),

          // JavaScript 챕터 항목
          if (isJsExpanded) ..._buildChapterItems(),

          // 고급 섹션 항목들
          ..._buildAdvancedChapters(250 + jsOffset),
        ],
      ),
    );
  }

  List<Widget> _buildChapterItems() {
    final List<Map<String, dynamic>> items = [
      {'top': 255.0, 'title': 'JavaScript의 개요'},
      {'top': 305.0, 'title': '기초 문법'},
      {'top': 355.0, 'title': '제어문'},
      {'top': 405.0, 'title': '함수 선언과 호출'},
      {'top': 455.0, 'title': '화살표 함수'},
    ];

    return items.map((item) {
      return ChapterItem(
        top: item['top'],
        title: item['title'],
        isSelected: selectedChapter == item['title'],
        onTap: () => setState(() => selectedChapter = item['title']),
      );
    }).toList();
  }

  List<Widget> _buildAdvancedChapters(double startTop) {
    final List<Map<String, dynamic>> sections = [
      {'title': 'DOM'},
      {'title': '비동기 처리'},
      {'title': 'JavaScript 고급 개념'},
      {'title': 'Node.js와 서버 개발'},
    ];

    double currentTop = startTop;

    return sections.map((section) {
      final String title = section['title']!;
      final bool expanded = sectionExpanded[title] ?? false;
      final double top = currentTop;
      currentTop += 60 + (expanded ? 40 : 0);

      return SectionItem(
        top: top,
        title: title,
        expanded: expanded,
        selected: selectedMain == title,
        onTap: () {
          setState(() {
            sectionExpanded.updateAll((key, value) => false);
            sectionExpanded[title] = !expanded;
            selectedMain = title;
            isJsExpanded = false;
          });
        },
      );
    }).toList();
  }
}