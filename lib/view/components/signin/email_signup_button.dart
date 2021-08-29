// 依存パッケージ
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 参照ファイル
import '/view_model/signin_view_model.dart';

class EmailSignupButton extends HookWidget {
  const EmailSignupButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signinViewModel = useProvider(signinViewModelProvider.notifier);
    return Container(
      margin: const EdgeInsets.all(8),
      width: 200,
      child: OutlinedButton(
        onPressed: signinViewModel.emailSignup,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(20),
          ),
        ),
        child: const Text('サインアップ'),
      ),
    );
  }
}
