import 'package:flutter/material.dart';
import 'auth_request_button.dart';

class EmailInputField extends StatefulWidget {
  final VoidCallback? onAuthRequest;

  const EmailInputField({super.key, this.onAuthRequest});

  @override
  State<EmailInputField> createState() => _EmailInputFieldState();
}

class _EmailInputFieldState extends State<EmailInputField> {
  late final TextEditingController _controller;
  bool _isInvalidEmail = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();

    _controller.addListener(() {
      setState(() {
        final text = _controller.text.trim();
        _isInvalidEmail = text.isNotEmpty && !_isValidEmail(text);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _isValidEmail(String email) {
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegExp.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    final isEmailValid =
        !_isInvalidEmail && _controller.text.trim().isNotEmpty;

    return SizedBox(
      width: 570,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '이메일',
            style: TextStyle(
              color: _isInvalidEmail ? const Color(0xFFFF0000) : Colors.grey,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: '이메일을 입력해주세요',
                    hintStyle: const TextStyle(color: Color(0xFFB3B3B3)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: _isInvalidEmail ? const Color(0xFFFF0000) : Colors.grey,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: _isInvalidEmail ? const Color(0xFFFF0000) : const Color(0xFF222831),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              AuthRequestButton(
                onPressed: isEmailValid
                    ? () {
                  widget.onAuthRequest?.call();
                }
                    : null,
                isEnabled: isEmailValid,
              ),
            ],
          ),
          if (_isInvalidEmail)
            const SizedBox(
              width: 565,
              child: Text(
                '잘못된 이메일 형식입니다.',
                style: TextStyle(
                  color: Color(0xFFFF0000),
                  fontFamily: 'NotoSansKr-Medium',
                  fontSize: 13,
                ),
              ),
            ),
        ],
      ),
    );
  }
}