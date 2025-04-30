import 'package:flutter/material.dart';
import '../widgets/id_confirmation.dart';

const Color primaryColor = Color(0xFF222831);
const Color borderColor = Color(0xFFDFDFDF);
const Color backgroundColor = Color(0xFFEBEBEB);

class IdConfirmationScreen extends StatelessWidget {
  const IdConfirmationScreen({super.key});

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
              const Expanded(child: IdConfirmation()),
            ],
          ),
        ),
      ),
    );
  }
}
