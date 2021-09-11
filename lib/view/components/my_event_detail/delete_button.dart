// 依存パッケージ
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 参照ファイル
import '/view_model/my_event_detail_view_model.dart';

class DeleteButton extends HookWidget {
  const DeleteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stateNotifier = useProvider(myEventDetailViewModelProvider.notifier);
    return Container(
      margin: const EdgeInsets.all(4),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.red,
        ),
        onPressed: () {
          stateNotifier.deleteEvent();
          Navigator.of(context).pop();
        },
        child: const Text('イベント削除'),
      ),
    );
  }
}
