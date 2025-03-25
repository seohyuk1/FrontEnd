import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/next_button.dart';

class FindIDBaseScreen extends StatelessWidget {
  final Widget child;
  final bool isNextButtonEnabled;
  final VoidCallback? onNextPressed;

  const FindIDBaseScreen({
    super.key,
    required this.child,
    this.isNextButtonEnabled = false,
    this.onNextPressed,
  });

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text('LOGO',
                  style: TextStyle(fontSize: 84, fontWeight: FontWeight.bold, color: Color(0xFF222831))),
              const SizedBox(height: 30),
              const Text(
                '본인 확인을 위해\n가입 시 사용한 이메일 주소를 입력해 주세요.',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Container(
                height: 20,
                width: 570,
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Color(0xFFC5C3C3), width: 1)),
                ),
              ),
              const SizedBox(height: 1),
              child,
              const Padding(
                padding: EdgeInsets.only(right: 110),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '· 입력한 이메일 주소는 아이디가 아닌 본인확인 이메일 주소입니다.',
                      style: TextStyle(fontSize: 13, color: Color(0xFF707070)),
                    ),
                    Text(
                      '· 인증 문자가 오지 않는다면 스팸메일함을 확인 해 주세요.',
                      style: TextStyle(fontSize: 13, color: Color(0xFF707070)),
                    ),
                    Text(
                      '· 선택약관동의에 따라 광고성 및 이벤트성 알림이 해당 이메일로 전송될 수 있습니다.',
                      style: TextStyle(fontSize: 13, color: Color(0xFF707070)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 21),
              NextButton(
                isEnabled: isNextButtonEnabled,
                onPressed: onNextPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}