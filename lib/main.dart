// 依存パッケージ
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 参照ファイル
import '/model/auth_model.dart';
import '/view/event_list_page.dart';
import '/view/signin_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '勉強会プラットフォーム',
      home: InitialView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InitialView extends HookWidget {
  const InitialView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userStream = useProvider(authStreamProvider);

    return userStream.when(
      data: (user) {
        if (user == null) {
          return const SigninPage();
        } else {
          return const EventListPage();
        }
      },
      loading: () {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      error: (err, stackTrace) {
        return Center(
          child: Text(err.toString()),
        );
      },
    );
  }
}
