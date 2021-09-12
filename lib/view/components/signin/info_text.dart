// 依存パッケージ
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 参照ファイル
import '/view_model/signin_view_model.dart';

class InfoText extends HookWidget {
  const InfoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenMaxWidth = MediaQuery.of(context).size.width;
    final infoText = useProvider(infoTextProvider);

    return Container(
      margin: const EdgeInsets.all(8),
      width: screenMaxWidth * 0.7,
      child: Text(
        infoText.state.toString(),
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}
