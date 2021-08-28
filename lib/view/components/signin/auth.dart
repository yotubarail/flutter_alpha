// // 依存パッケージ
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// // 参照ファイル
// import '/model/signin_model.dart';
// import '/view_model/signin_view_model.dart';

// class Auth extends HookWidget {
//   const Auth({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // final futureLogout = useProvider(logoutProvider);
//     // final logout = useFuture(futureLogout);
//     final authP = useProvider(authFutureProvider);
//     final auth = useFuture(authP);
//     final String data;
//     if (auth.data is String) {
//       data = auth.data!;
//     } else {
//       data = auth.data.toString();
//     }
//     return Container(
//       margin: const EdgeInsets.all(8),
//       width: 200,
//       // child: Text('test'),
//       child: Text(data),
//     );
//   }
// }
