// 依存パッケージ
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TitleForm extends StatelessWidget {
  const TitleForm({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final screenMaxHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenMaxHeight * 0.1,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(left: 8, right: 8),
      child: TextFormField(
        initialValue: title,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'タイトル',
        ),
      ),
    );
  }
}
