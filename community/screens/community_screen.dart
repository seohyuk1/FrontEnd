import 'package:flutter/material.dart';
import 'package:graduate/main_sidebar/screens/main_sidebar_screen.dart';
import '../widgets/sidebar.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SidebarMenu();
  }
}

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  final List<Map<String, String>> posts = const [
    {
      'title': 'JavaScript의 비동기 처리, Async/Await로 쉽게 이해하기',
      'writer': '관리자',
      'date': '2025-01-02',
      'views': '6',
      'comments': '4',
    },
    {
      'title': 'JavaScript로 DOM 조작을 할 때 querySelector와 getElementById 중...',
      'writer': '관리자',
      'date': '2025-01-01',
      'views': '19',
      'comments': '10',
    },
    {
      'title': 'forEach와 map의 차이점은 무엇인가요?',
      'writer': '관리자',
      'date': '2024-12-30',
      'views': '3',
      'comments': '5',
    },
    {
      'title': '이벤트 위임(Event Delegation)은 왜 사용하는 건가요?',
      'writer': '관리자',
      'date': '2024-12-25',
      'views': '4',
      'comments': '2',
    },
    {
      'title': '비교 연산자 == vs ===, 어떤 걸 써야 할까?',
      'writer': '관리자',
      'date': '2025-01-14',
      'views': '3',
      'comments': '6',
    },
    {
      'title': 'Closure는 왜 중요한가? JavaScript의 핵심 개념 정리',
      'writer': '관리자',
      'date': '2024-12-20',
      'views': '24',
      'comments': '19',
    },
    {
      'title': '비동기 함수에서 데이터를 반환하려면 어떻게 해야 하나요?',
      'writer': '관리자',
      'date': '2024-12-18',
      'views': '0',
      'comments': '0',
    },
    {
      'title': '배열의 중복 요소를 제거하려면 가장 간단한 방법이 무엇인가요?',
      'writer': '관리자',
      'date': '2024-12-10',
      'views': '2',
      'comments': '2',
    },
    {
      'title': 'JavaScript 성능 최적화 팁: 코드 개선 사례',
      'writer': '관리자',
      'date': '2024-12-01',
      'views': '1',
      'comments': '3',
    },
    {
      'title': 'Vanilla JS로 슬라이드 쇼 구현하기 (코드 포함)',
      'writer': '관리자',
      'date': '2024-11-11',
      'views': '17',
      'comments': '11',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          const Sidebar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(width: 1190, height: 800, color: const Color(0xFFEBEBEB)),
                  ),
                  Positioned(
                    left: 0,
                    top: 20,
                    child: Container(width: 1190, height: 130, color: const Color(0xFF222831)),
                  ),
                  const Positioned(
                    left: 25,
                    top: 30,
                    child: Text('Community', style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900, color: Colors.white)),
                  ),
                  const Positioned(
                    left: 25,
                    top: 105,
                    child: Text('질문을 올리고 정보를 나누어 보세요.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white)),
                  ),
                  _buildButton('공지', 36),
                  _buildButton('JS', 136),
                  _buildButton('Git', 236),
                  Positioned(
                    left: 36,
                    top: 245,
                    child: Container(width: 280, height: 1.5, color: const Color(0xFF222831)),
                  ),
                  Positioned(
                    left: 772,
                    top: 195,
                    child: Container(
                      width: 300,
                      height: 43,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF222831)),
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF8F8F8),
                      ),
                      padding: const EdgeInsets.only(left: 12, top: 12),
                      child: const Text('제목을 입력해주세요.', style: TextStyle(color: Color(0xFFA5A5A5), fontSize: 14)),
                    ),
                  ),
                  Positioned(
                    left: 1072,
                    top: 195,
                    child: Container(
                      width: 40,
                      height: 43,
                      decoration: const BoxDecoration(
                        color: Color(0xFF393E46),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                      ),
                      child: const Icon(Icons.search, color: Colors.white),
                    ),
                  ),
                  Positioned(
                    left: 36,
                    top: 246,
                    child: Container(
                      width: 1090,
                      height: 55,
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Color(0xFF222831), width: 1.5)),
                        color: Color(0xFFEBEBEB),
                      ),
                      child: Row(
                        children: [
                          _buildHeaderCell('제목', 490),
                          _buildHeaderCell('작성자', 160),
                          _buildHeaderCell('작성일', 160),
                          _buildHeaderCell('조회', 140),
                          _buildHeaderCell('댓글', 140),
                        ],
                      ),
                    ),
                  ),
                  ...List.generate(posts.length, (index) {
                    return _buildListRow(
                      top: 301.0 + index * 43,
                      title: posts[index]['title']!,
                      writer: posts[index]['writer']!,
                      date: posts[index]['date']!,
                      views: posts[index]['views']!,
                      comments: posts[index]['comments']!,
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Positioned _buildButton(String label, double left) {
    return Positioned(
      left: left,
      top: 175,
      child: Container(
        width: 100,
        height: 55,
        color: const Color(0xFFEBEBEB),
        child: Center(
          child: Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String text, double width) {
    return Container(
      width: width,
      alignment: Alignment.center,
      child: Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Positioned _buildListRow({
    required double top,
    required String title,
    required String writer,
    required String date,
    required String views,
    required String comments,
  }) {
    return Positioned(
      left: 36,
      top: top,
      child: Container(
        width: 1090,
        height: 43,
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFFCFCFCF), width: 1.5)),
          color: Color(0xFFEBEBEB),
        ),
        child: Row(
          children: [
            _buildListCell(title, 490),
            _buildListCell(writer, 160),
            _buildListCell(date, 160),
            _buildListCell(views, 140),
            _buildListCell(comments, 140),
          ],
        ),
      ),
    );
  }

  Widget _buildListCell(String text, double width) {
    return Container(
      width: width,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(text, style: const TextStyle(fontSize: 16), overflow: TextOverflow.ellipsis),
    );
  }
}