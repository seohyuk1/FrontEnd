import 'package:flutter/material.dart';
import '../../shared/find_Layout.dart';
import '../widgets/password_notice.dart';
import '../../shared/widgets/email.dart';
import '../../shared/widgets/auth_code.dart';
import 'password_reset_page.dart';

class FindPasswordScreen extends StatefulWidget {
  const FindPasswordScreen({super.key});

  @override
  State<FindPasswordScreen> createState() => _FindPasswordScreenState();
}

class _FindPasswordScreenState extends State<FindPasswordScreen> {
  bool _showAuthCodeField = false;
  bool _isCodeValid = false;

  // 인증요청 시 인증 코드 입력창 표시
  void _handleAuthRequest() {
    setState(() {
      _showAuthCodeField = true;
    });
  }

  // 인증번호 입력값 감지
  void _handleCodeChanged(String code) {
    setState(() {
      _isCodeValid = RegExp(r'^\d{6}$').hasMatch(code);
    });
  }

  // 다음 버튼 클릭 시 PasswordReset 페이지로 이동
  void _handleNextPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PasswordReset()),
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Password_Notice(
      isNextButtonEnabled: _isCodeValid,
      onNextPressed: _handleNextPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 1),

          // 이메일 입력 필드
          EmailInputField(onAuthRequest: _handleAuthRequest),
          const SizedBox(height: 16),

          // 인증번호 입력 필드 (조건부 표시)
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _showAuthCodeField
                ? AuthCodeInputField(
              key: const ValueKey('auth'),
              onCodeChanged: _handleCodeChanged,
            )
                : const SizedBox(height: 88, key: ValueKey('empty')),
          ),

          const SizedBox(height: 90),
        ],
      ),
    );
  }
}