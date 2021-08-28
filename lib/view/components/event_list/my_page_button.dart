// 依存パッケージ
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 参照ファイル
import '/view_model/signin_view_model.dart';

class MyPageButton extends ConsumerWidget {
  const MyPageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 200,
      child: ElevatedButton(
        onPressed: () => '',
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(20),
          ),
        ),
        child: const Text('マイページ'),
      ),
    );
  }
}
