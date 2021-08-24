// 依存パッケージ
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

// 参照ファイル
import '/model/login_model.dart';
import '/view/components/anonyous_login_button.dart';
import '/view/components/email_form.dart';
import '/view/components/email_login_button.dart';
import '/view/components/password_form.dart';
import '/view_model/login_view_model.dart';

class LoginView extends ConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final user = watch(userIdStreamProvider);
    final pressAnonymousLogin = FirebaseAuth.instance.signInAnonymously();
    final password = watch(passwordProvider).state;
    // final emailLogin = FirebaseAuth.instance.createUserWithEmailAndPassword(
    //   email: email,
    //   password: password,
    // );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            EmailForm(),
            PasswordForm(state: password),
            AnoymousLoginButton(onPressed: pressAnonymousLogin),
            // EmailLoginButton(onPressed: emailLogin),
            SizedBox(
              child: TextFormField(
                initialValue: watch(emailProvider).state,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'メールアドレス',
                ),
                onChanged: (value) {
                  watch(emailProvider).state = value;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print(watch(emailProvider).state);
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.all(20),
                ),
              ),
              child: const Text('print'),
            ),
          ],
        ),
      ),
    );
  }
}

// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);

//   @override
//   _LoginState createState() => _LoginState();
// }

// // ログインState
// class _LoginState extends State<Login> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pushNamed('/events');
//               },
//               style: ButtonStyle(
//                 padding: MaterialStateProperty.all(
//                   const EdgeInsets.all(20),
//                 ),
//               ),
//               child: const Text('ログイン'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
