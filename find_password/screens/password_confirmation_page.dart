import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/password_confirmation_content.dart'; // 변경된 위젯 import

class PasswordConfirmationPage extends StatelessWidget {
  const PasswordConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Container(
          width: 768,
          constraints: const BoxConstraints(minHeight: 786),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: borderColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const Text(
                'LOGO',
                style: TextStyle(
                  fontSize: 84,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF222831),
                ),
              ),
              const SizedBox(height: 30),

              // LOGO 외 모든 내용
              const Expanded(child: PasswordConfirmationContent()),
            ],
          ),
        ),
      ),
    );
  }
}
