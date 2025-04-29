import 'package:flutter/material.dart';

class AuthCodeInputField extends StatefulWidget {
  final void Function(String)? onCodeChanged;

  const AuthCodeInputField({super.key, this.onCodeChanged});

  @override
  State<AuthCodeInputField> createState() => _AuthCodeInputFieldState();
}

class _AuthCodeInputFieldState extends State<AuthCodeInputField> {
  final TextEditingController _controller = TextEditingController();
  bool _isInvalidCode = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final code = _controller.text.trim();
      setState(() {
        _isInvalidCode = code.isNotEmpty && !_isValidCode(code);
      });
      widget.onCodeChanged?.call(code); // 부모로 전달
    });
  }

  bool _isValidCode(String code) {
    return RegExp(r'^\d{6}$').hasMatch(code);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 570,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "인증번호",
            style: TextStyle(
              fontSize: 16,
              color: _isInvalidCode ? const Color(0xFFFF0000) : Colors.grey,
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "인증번호 6자리를 입력해주세요.",
              hintStyle: const TextStyle(color: Color(0xFFB3B3B3)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: _isInvalidCode ? const Color(0xFFFF0000) : Colors.grey,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: _isInvalidCode
                      ? const Color(0xFFFF0000)
                      : const Color(0xFF222831),
                  width: 1,
                ),
              ),
            ),
          ),
          if (_isInvalidCode)
            const Padding(
              padding: EdgeInsets.only(top: 6),
              child: Text(
                '올바른 인증번호를 입력해주세요.',
                style: TextStyle(
                  color: Color(0xFFFF0000),
                  fontSize: 13,
                  fontFamily: 'NotoSansKr-Medium',
                ),
              ),
            ),
        ],
      ),
    );
  }
}