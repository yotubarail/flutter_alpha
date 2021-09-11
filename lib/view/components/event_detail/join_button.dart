// 依存パッケージ
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 参照ファイル
import '/view_model/event_detail_view_model.dart';

class JoinButton extends HookWidget {
  const JoinButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stateNotifier = useProvider(eventDetailViewModelProvider.notifier);

    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: stateNotifier.joinEvent,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(20),
          ),
        ),
        child: const Text('申し込む'),
      ),
    );
  }
}
