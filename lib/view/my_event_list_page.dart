// 依存パッケージ
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// 参照ファイル
import '/view/components/app_bar/logout_button.dart';
import '/view/components/event_list/event_card_list.dart';

class MyEventListPage extends HookWidget {
  const MyEventListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Event List'),
        actions: const [LogoutButton()],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          EventCardList(),
        ],
      ),
    );
  }
}
