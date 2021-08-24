// 依存パッケージ
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordForm extends ConsumerWidget {
  PasswordForm({
    required this.state,
    Key? key,
  }) : super(key: key);
  String state;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: deviceWidth * 0.6,
      child: TextFormField(
        initialValue: state,
        obscureText: true,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'パスワード',
        ),
        onChanged: (value) {
          state = value;
        },
      ),
    );
  }
}
