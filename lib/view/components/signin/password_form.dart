// 依存パッケージ
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 参照ファイル
import '/view_model/login_view_model.dart';

class PasswordForm extends ConsumerWidget {
  const PasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(8),
      width: deviceWidth * 0.7,
      child: TextFormField(
        initialValue: watch(passwordProvider).state,
        obscureText: true,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'パスワード',
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => (value!.isEmpty) ? 'パスワードを入力してください' : null,
        onChanged: (value) {
          watch(passwordProvider).state = value;
        },
      ),
    );
  }
}
