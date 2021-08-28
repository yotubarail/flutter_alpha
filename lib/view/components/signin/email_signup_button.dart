// 依存パッケージ
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 参照ファイル
import '/view_model/signin_view_model.dart';

class EmailSignupButton extends ConsumerWidget {
  const EmailSignupButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final vm = watch(signinViewModelProvider.notifier);
    return Container(
      margin: const EdgeInsets.all(8),
      width: 200,
      child: OutlinedButton(
        onPressed: vm.emailSignup,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(20),
          ),
        ),
        // child: const Text('サインアップ'),
        child: const Text('サインアウト'),
      ),
    );
  }
}
