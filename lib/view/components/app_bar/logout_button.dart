// 依存パッケージ
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 参照ファイル
import '/model/auth_model.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Auth();
    return IconButton(
      icon: const Icon(Icons.logout),
      onPressed: () async {
        await auth.signOut();
        Navigator.of(context).pop();
      },
    );
  }
}
