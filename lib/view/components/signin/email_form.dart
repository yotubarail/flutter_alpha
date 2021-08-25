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
    final deviceWidth = MediaQuery.of(context).size.width;
    final emailPattern = RegExp(
        r'^[a-zA-Z0-9_.+-]+@([a-zA-Z0-9][a-zA-Z0-9-]*[a-zA-Z0-9]*\.)+[a-zA-Z]{2,}$');
    return Container(
      margin: const EdgeInsets.all(8),
      width: deviceWidth * 0.7,
      child: TextFormField(
        initialValue: watch(emailProvider).state,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'メールアドレス',
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) =>
            !emailPattern.hasMatch(value!) ? 'メールアドレスを入力してください' : null,
        onChanged: (value) {
          watch(emailProvider).state = value;
        },
      ),
    );
  }
}




// class SignUp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         final FocusScopeNode currentScope = FocusScope.of(context);
//         if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
//           FocusManager.instance.primaryFocus!.unfocus();
//         }
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('サインアップ'),
//         ),
//         body: Center(
//           child: Form(
//             child: AutofillGroup(
//               child: Container(
//                 padding: const EdgeInsets.all(50.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     TextFormField(
//                       decoration: const InputDecoration(
//                         hintText: 'メールアドレスを入力してください',
//                         labelText: 'メールアドレス *',
//                       ),
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       validator: (value) =>
//                       !(new RegExp(
//                           r'^[a-zA-Z0-9_.+-]+@([a-zA-Z0-9][a-zA-Z0-9-]*[a-zA-Z0-9]*\.)+[a-zA-Z]{2,}$')
//                           .hasMatch(value!)) ? 'メールアドレスを入力してください' : null,
//                       keyboardType: TextInputType.emailAddress,
//                     ),
//                     TextFormField(
//                       decoration: const InputDecoration(
//                           hintText: 'パスワードを入力してください',
//                           labelText: 'パスワード'
//                       ),
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       validator: (value) =>
//                       (value!.isEmpty)
//                           ? 'パスワードを入力してください'
//                           : null,
//                       obscureText: true,
//                       keyboardType: TextInputType.visiblePassword,
//                     ),
//                     Padding(padding: EdgeInsets.only(bottom: 20.0)),
//                     ElevatedButton(
//                       child: const Text('ログイン'),
//                       style: ElevatedButton.styleFrom(
//                           primary: Colors.amber,
//                           padding: EdgeInsets.all(20.0)
//                       ),
//                       onPressed: () {},
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }