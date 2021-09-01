// 依存パッケージ
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 参照ファイル
import '/model/auth_model.dart';
import '/model/events_model.dart';
import '/view/components/my_event_detail/body_form.dart';
import '/view/components/my_event_detail/guest_count.dart';
import '/view/components/my_event_detail/save_button.dart';
import '/view/components/my_event_detail/title_form.dart';
import '/view_model/my_event_detail_view_model.dart';

class MyEventDetailPage extends HookWidget {
  const MyEventDetailPage({
    Key? key,
    required this.event,
  }) : super(key: key);
  final Event event;

  @override
  Widget build(BuildContext context) {
    final user = Auth().getCurrentUser();
    useProvider(myEventDetailViewModelProvider.notifier).initEvent(
      event: event,
      uid: user.uid,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Event Detail'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          TitleForm(),
          EventBody(),
          GuestCount(),
          SaveButton(),
        ],
      ),
    );
  }
}
