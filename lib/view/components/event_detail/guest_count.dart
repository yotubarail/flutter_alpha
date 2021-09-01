// 依存パッケージ
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 参照ファイル
import '/view_model/event_detail_view_model.dart';

class GuestCount extends HookWidget {
  const GuestCount({
    Key? key,
    required this.guestCount,
  }) : super(key: key);
  final int guestCount;

  @override
  Widget build(BuildContext context) {
    final eventDetailViewModel = useProvider(eventDetailViewModelProvider);

    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Text(
          '申し込み数：${eventDetailViewModel.guestCount}人',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
