import 'package:flutter/material.dart';
import '../../shared/Layout.dart';

class Password_Notice extends StatelessWidget {
  final Widget child;
  final bool isNextButtonEnabled;
  final VoidCallback? onNextPressed;

  const Password_Notice({
    super.key,
    required this.child,
    this.isNextButtonEnabled = false,
    this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      header: const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 99),
          child: Text(
            '비밀번호 재설정을 위해\n이메일 주소를 입력해 주세요.',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      child: child,
      isNextButtonEnabled: isNextButtonEnabled,
      onNextPressed: onNextPressed,
    );
  }
}