// 依存パッケージ
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 参照ファイル
import '/view_model/login_view_model.dart';

class CounterController extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}

class EmailForm extends ConsumerWidget {
  EmailForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final deviceWidth = MediaQuery.of(context).size.width;
    var email = watch(emailProvider).state;
    return SizedBox(
      width: deviceWidth * 0.6,
      child: TextFormField(
        initialValue: email,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'メールアドレス',
        ),
        onChanged: (value) {
          email = value;
        },
      ),
    );
  }
}
