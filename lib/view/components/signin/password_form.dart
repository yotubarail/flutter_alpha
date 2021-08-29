// 依存パッケージ
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 参照ファイル
import '/view_model/signin_view_model.dart';

class PasswordForm extends HookWidget {
  const PasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenMaxWidth = MediaQuery.of(context).size.width;
    final signinViewModel = useProvider(signinViewModelProvider.notifier);

    return Container(
      margin: const EdgeInsets.all(8),
      width: screenMaxWidth * 0.7,
      child: TextFormField(
        initialValue: signinViewModel.state.password,
        onChanged: signinViewModel.changePassword,
        validator: (value) =>
            signinViewModel.validatePassword() ? 'パスワードを入力してください' : null,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: true,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'パスワード',
        ),
      ),
    );
  }
}
