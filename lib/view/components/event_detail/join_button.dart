// 依存パッケージ
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class JoinButton extends StatelessWidget {
  const JoinButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(20),
          ),
        ),
        child: const Text('申し込む'),
      ),
    );
  }
}
