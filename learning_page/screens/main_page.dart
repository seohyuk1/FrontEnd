import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import '../widgets/nodejs_box.dart';
import '../widgets/git_box.dart';
import '../main_layout.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
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
    return Scaffold(
      body: Stack(
        children: [
          const Sidebar(), // 왼쪽 사이드바
          Transform.translate(
            offset: const Offset(32, 0),
            child: MainLayout(
              children: [
                // Node.js 카드
                NodeJsCard(
                  top: 180,
                  isExpanded: _isFirstExpanded,
                  onToggle: _toggleFirstCardExpand,
                ),
                // Git 카드
                GitCard(
                  top: _isFirstExpanded ? 540 : 440,
                  isExpanded: _isSecondExpanded,
                  onToggle: _toggleSecondCardExpand,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}