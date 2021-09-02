// 依存パッケージ
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 参照ファイル
import '/model/auth_model.dart';
import '/model/events_model.dart';
import '/view/my_event_detail_page.dart';
import '/view_model/my_event_detail_view_model.dart';

class NewButton extends HookWidget {
  const NewButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uid = Auth().getCurrentUser().uid;
    final newId = randomString(20);
    final now = DateTime.now();
    final newEvent =
        Event(id: newId, uid: uid, title: '新規イベント', updateTime: now);
    final notifier = useProvider(myEventDetailViewModelProvider.notifier);

    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          notifier.createEvent(newEvent);
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) {
                return MyEventDetailPage(event: newEvent);
              },
            ),
          );
        },
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(20),
          ),
        ),
        child: const Text('新規作成'),
      ),
    );
  }

  String randomString(int length) {
    const _randomChars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const _charsLength = _randomChars.length;

    final rand = Random();
    final codeUnits = List.generate(
      length,
      (index) {
        final n = rand.nextInt(_charsLength);
        return _randomChars.codeUnitAt(n);
      },
    );
    return String.fromCharCodes(codeUnits);
  }
}
