import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SidebarMenuItem extends StatelessWidget {
  final double top;
  final String iconPath;
  final String label;
  final String selectedLabel;
  final Function(String) onTap;

  const SidebarMenuItem({
    super.key,
    required this.top,
    required this.iconPath,
    required this.label,
    required this.selectedLabel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = label == selectedLabel;
    final Color textColor = isSelected ? const Color(0xFFEBEBEB) : const Color(0xFF222831);

    return Positioned(
      top: top,
      left: 0,
      child: GestureDetector(
        onTap: () => onTap(label),
        child: Container(
          width: 250,    // 전체 영역
          height: 48,    // 선택 배경 높이와 동일
          color: Colors.transparent,  // 클릭 가능한 영역 확인용
          child: Row(
            children: [
              const SizedBox(width: 45),
              SizedBox(
                width: 24,
                height: 24,
                child: SvgPicture.asset(
                  iconPath,
                  fit: BoxFit.contain,
                  color: textColor,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                label,
                style: TextStyle(
                  color: textColor,
                  fontFamily: 'NotoSansKr-Bold',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}