import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/sidebar_menu_item.dart';
import '../widgets/sidebar_section_label.dart';
import '../widgets/selected_menu_background.dart';

class SidebarMenu extends StatefulWidget {
  const SidebarMenu({super.key});

  @override
  State<SidebarMenu> createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu> {
  String selectedMenu = '메인';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 1024,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // 배경
          Container(
            width: 250,
            height: 1024,
            decoration: const BoxDecoration(
              color: Color(0xFFEBEBEB),
              // border 제거함
            ),
          ),

          // 오른쪽 검정색 줄
          Positioned(
            left: 250,
            top: 0,
            bottom: 0,
            child: Container(
              width: 2,
              color: const Color(0xFF222831),
            ),
          ),

          // 선택된 메뉴 배경
          SelectedMenuBackground(top: _getTopByMenu(selectedMenu)),

          // 로고
          Positioned(
            top: 32,
            child: SizedBox(
              width: 250,
              child: Center(
                child: Text(
                  'LOGO',
                  style: TextStyle(
                    color: const Color(0xFF222831),
                    fontFamily: 'NotoSansKr-Black',
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.0,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ),

          // 메뉴 아이템들
          SidebarMenuItem(
            top: 130,
            iconPath: 'assets/icons/home.svg',
            label: '메인',
            selectedLabel: selectedMenu,
            onTap: _onMenuSelect,
          ),
          SidebarMenuItem(
            top: 230,
            iconPath: 'assets/icons/learning-progress.svg',
            label: '학습 진행',
            selectedLabel: selectedMenu,
            onTap: _onMenuSelect,
          ),
          SidebarMenuItem(
            top: 290,
            iconPath: 'assets/icons/quiz.svg',
            label: '퀴즈',
            selectedLabel: selectedMenu,
            onTap: _onMenuSelect,
          ),
          SidebarMenuItem(
            top: 350,
            iconPath: 'assets/icons/achievement.svg',
            label: '성취도 및 진행도',
            selectedLabel: selectedMenu,
            onTap: _onMenuSelect,
          ),
          SidebarMenuItem(
            top: 460,
            iconPath: 'assets/icons/community.svg',
            label: '커뮤니티',
            selectedLabel: selectedMenu,
            onTap: _onMenuSelect,
          ),
          SidebarMenuItem(
            top: 520,
            iconPath: 'assets/icons/news.svg',
            label: 'IT 기사',
            selectedLabel: selectedMenu,
            onTap: _onMenuSelect,
          ),
          SidebarMenuItem(
            top: 610,
            iconPath: 'assets/icons/profile.svg',
            label: '프로필',
            selectedLabel: selectedMenu,
            onTap: _onMenuSelect,
          ),
          SidebarMenuItem(
            top: 670,
            iconPath: 'assets/icons/bell.svg',
            label: '내소식',
            selectedLabel: selectedMenu,
            onTap: _onMenuSelect,
          ),

          // 섹션 라벨
          const Positioned(left: 44, top: 100, child: SidebarSectionLabel(title: '메인')),
          const Positioned(left: 45, top: 200, child: SidebarSectionLabel(title: '학습')),
          const Positioned(left: 44, top: 430, child: SidebarSectionLabel(title: '커뮤니티')),
          const Positioned(left: 44, top: 580, child: SidebarSectionLabel(title: '기타')),

          // 좌측 chevrons-left 아이콘
          Positioned(
            left: -20,
            top: 740,
            child: SizedBox(
              width: 48,
              height: 48,
              child: SvgPicture.asset(
                'assets/icons/chevrons-left.svg',
                width: 48,
                height: 48,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onMenuSelect(String label) {
    setState(() {
      selectedMenu = label;
    });
  }

  double _getTopByMenu(String label) {
    switch (label) {
      case '메인':
        return 130;
      case '학습 진행':
        return 230;
      case '퀴즈':
        return 290;
      case '성취도 및 진행도':
        return 350;
      case '커뮤니티':
        return 460;
      case 'IT 기사':
        return 520;
      case '프로필':
        return 610;
      case '내소식':
        return 670;
      default:
        return 130;
    }
  }
}