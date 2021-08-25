// 依存パッケージ
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

// 参照ファイル
import '/view_model/login_view_model.dart';

class EmailSigninButton extends ConsumerWidget {
  const EmailSigninButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final email = watch(emailProvider).state;
    final password = watch(passwordProvider).state;
    const status = true;
    return Container(
      margin: const EdgeInsets.all(8),
      width: 200,
      child: ElevatedButton(
        onPressed: status
            ? () => FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: email.toString(),
                  password: password.toString(),
                )
            : null,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(20),
          ),
        ),
        child: const Text('サインイン'),
      ),
    );
  }
}
