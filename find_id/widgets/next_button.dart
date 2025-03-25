import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback? onPressed;

  const NextButton({
    super.key,
    this.isEnabled = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 531,
      height: 53,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.grey[300]!;
            }
            return const Color(0xFF222831);
          }),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return const Color(0xFFC0C0C0);
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          elevation: MaterialStateProperty.all(0),
        ),
        child: const Text('다음', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}