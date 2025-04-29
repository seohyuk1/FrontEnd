import 'package:flutter/material.dart';

class AuthRequestButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isEnabled;

  const AuthRequestButton({
    super.key,
    required this.onPressed,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 92,
      height: 57,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor:
          isEnabled ? const Color(0xFF222831) : const Color(0xFFFFFFFF), // 배경 흰색 유지
          disabledBackgroundColor: const Color(0xFFFFFFFF), // 비활성 배경도 흰색
          disabledForegroundColor: const Color(0xFFDDDDDD), // 텍스트 회색
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
            side: BorderSide(
              color: isEnabled
                  ? const Color(0xFF222831)
                  : const Color(0xFFDDDDDD), // 테두리 회색
            ),
          ),
          padding: EdgeInsets.zero,
          elevation: 0,
        ),
        child: Text(
          '인증요청',
          style: TextStyle(
            fontSize: 15,
            color:
            isEnabled ? const Color(0xFFFFFFFF) : const Color(0xFFDDDDDD),
          ),
        ),
      ),
    );
  }
}