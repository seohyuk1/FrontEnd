import 'package:flutter/material.dart';

class IdConfirmation extends StatelessWidget {
  const IdConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 텍스트1
        const SizedBox(
          width: 570,
          child: Text(
            '아이디 확인이 완료되었습니다!\n로그인 후 학습을 진행해보세요!',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              fontFamily: 'NotoSansKr',
              height: 1.46,
              color: Colors.black,
            ),
          ),
        ),

        const SizedBox(height: 20),

        // 회색 선
        Container(
          width: 570,
          height: 1,
          color: const Color(0xFFC5C3C3),
        ),

        const SizedBox(height: 40),

        // 텍스트2
        const SizedBox(
          width: 570,
          child: Text(
            '확인되었습니다!\n회원님의 아이디는 **\'user1234\'**입니다.\n로그인 후 다양한 서비스를 이용해 보세요!',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              fontFamily: 'NotoSansKr',
              height: 1.46,
              color: Colors.black,
            ),
          ),
        ),

        const Spacer(),

        // 로그인 버튼
        Container(
          width: 531,
          height: 53,
          decoration: BoxDecoration(
            color: const Color(0xFF222831),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white, width: 1),
          ),
          child: const Center(
            child: Text(
              '로그인',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontFamily: 'NotoSansKr',
                color: Colors.white,
                height: 1.0,
              ),
            ),
          ),
        ),

        const SizedBox(height: 40),
      ],
    );
  }
}