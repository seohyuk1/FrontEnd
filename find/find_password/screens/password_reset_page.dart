import 'package:flutter/material.dart';
import '../../shared/find_Layout.dart';
import '../../shared/widgets/next_button.dart';
import 'password_confirmation_page.dart';

const Color primaryColor = Color(0xFF222831);
const Color borderColor = Color(0xFFDFDFDF);
const Color backgroundColor = Color(0xFFEBEBEB);

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController = TextEditingController();

  bool _isPasswordInvalid = false;
  bool _isPasswordConfirmInvalid = false;
  bool _isNextButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_validateForm);
    _passwordConfirmController.addListener(_validateForm);
  }

  void _validateForm() {
    final password = _passwordController.text;
    final confirm = _passwordConfirmController.text;

    setState(() {
      _isPasswordInvalid = password.isEmpty;
      _isPasswordConfirmInvalid = confirm.isEmpty || password != confirm;
      _isNextButtonEnabled = password.isNotEmpty && confirm.isNotEmpty && password == confirm;
    });
  }

  void _onNextPressed() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PasswordConfirmationPage()),
      );
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 768,
            constraints: const BoxConstraints(minHeight: 786),
            padding: const EdgeInsets.symmetric(horizontal: 99, vertical: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: borderColor),
            ),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'LOGO',
                    style: TextStyle(
                      fontSize: 84,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF222831),
                      fontFamily: 'NotoSansKr-Black',
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '새로 사용할 비밀번호를\n입력해 주세요.',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NotoSansKr-Medium',
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: 570,
                    height: 1,
                    color: const Color(0xFFC5C3C3),
                  ),
                  const SizedBox(height: 20),

                  // 새 비밀번호
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '새 비밀번호',
                      style: TextStyle(
                        fontSize: 16,
                        color: _isPasswordInvalid ? Colors.red : const Color(0xFF757575),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: _buildInputDecoration('새 비밀번호를 입력 해 주세요.'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '비밀번호를 입력해 주세요.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // 비밀번호 확인
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '비밀번호 확인',
                      style: TextStyle(
                        fontSize: 16,
                        color: _isPasswordConfirmInvalid ? Colors.red : const Color(0xFF757575),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordConfirmController,
                    obscureText: true,
                    decoration: _buildInputDecoration('비밀번호 확인을 입력 해 주세요.'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '비밀번호 확인을 입력해 주세요.';
                      }
                      if (value != _passwordController.text) {
                        return '비밀번호가 일치하지 않습니다.';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 100),

                  const Padding(
                    padding: EdgeInsets.only(right: 195),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '· 입력한 아이디는 회원가입 후 로그인을 진행하기 위한 아이디입니다.',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF707070),
                            fontFamily: 'NotoSansKr-Medium',
                          ),
                          overflow: TextOverflow.visible,
                          softWrap: false,
                        ),
                        SizedBox(height: 4),
                        Text(
                          '· 경우에 따라 특수문자 및 특수기호 등 사용이 불가능합니다.',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF707070),
                            fontFamily: 'NotoSansKr-Medium',
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 5),

                  // 다음 버튼
                  NextButton(
                    isEnabled: _isNextButtonEnabled,
                    onPressed: _onNextPressed,
                  ),

                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      hintStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black26,
        fontFamily: 'NotoSansKr-Medium',
      ),
      errorStyle: const TextStyle(
        color: Colors.red,
        fontSize: 13,
        height: 1.2,
      ),
      alignLabelWithHint: false,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF222831)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFFF0000)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFFF0000)),
      ),
    );
  }
}