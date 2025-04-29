import 'package:flutter/material.dart';
import '../../shared/Layout.dart';

class id_notice extends StatelessWidget {
  final Widget child;
  final bool isNextButtonEnabled;
  final VoidCallback? onNextPressed;

  const id_notice({
    super.key,
    required this.child,
    this.isNextButtonEnabled = false,
    this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      header: const Text(
        '본인 확인을 위해\n가입 시 사용한 이메일 주소를 입력해 주세요.',
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      child: child,
      isNextButtonEnabled: isNextButtonEnabled,
      onNextPressed: onNextPressed,
    );
  }
}