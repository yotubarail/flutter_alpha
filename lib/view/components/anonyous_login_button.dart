// 依存パッケージ
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnoymousLoginButton extends StatelessWidget {
  const AnoymousLoginButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  final Future onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(20),
        ),
      ),
      child: const Text('テストログイン'),
    );
  }
}
