import 'package:flutter/material.dart';
import '../../shared/find_Layout.dart';
import '../widgets/id_notice.dart';
import '../../shared/widgets/email.dart';
import '../../shared/widgets/auth_code.dart';
import 'id_confirmation_screen.dart'; // 페이지 전환용

class FindIDScreen extends StatefulWidget {
  const FindIDScreen({super.key});

  @override
  State<FindIDScreen> createState() => _FindIDScreenState();
}

class _FindIDScreenState extends State<FindIDScreen> {
  bool _showAuthCodeField = false;
  bool _isCodeValid = false;

  void _handleAuthRequest() {
    setState(() {
      _showAuthCodeField = true;
    });
  }

  void _handleCodeChanged(String code) {
    setState(() {
      _isCodeValid = RegExp(r'^\d{6}$').hasMatch(code);
    });
  }

  void _handleNextPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const IdConfirmationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return id_notice(
      isNextButtonEnabled: _isCodeValid,
      onNextPressed: _handleNextPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 1),
          EmailInputField(onAuthRequest: _handleAuthRequest),
          const SizedBox(height: 16),
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