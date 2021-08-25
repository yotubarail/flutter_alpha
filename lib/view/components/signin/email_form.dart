// 依存パッケージ
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 参照ファイル
import '/view_model/login_view_model.dart';

class EmailForm extends ConsumerWidget {
  const EmailForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final screenMaxWidth = MediaQuery.of(context).size.width;
    final email = watch(emailProvider);
    final emailPattern = RegExp(
        r'^[a-zA-Z0-9_.+-]+@([a-zA-Z0-9][a-zA-Z0-9-]*[a-zA-Z0-9]*\.)+[a-zA-Z]{2,}$');
    return Container(
      margin: const EdgeInsets.all(8),
      width: screenMaxWidth * 0.7,
      child: TextFormField(
        initialValue: email.state,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'メールアドレス',
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) =>
            !emailPattern.hasMatch(value!) ? 'メールアドレスを入力してください' : null,
        onChanged: (value) {
          email.state = value;
        },
      ),
    );
  }
}
