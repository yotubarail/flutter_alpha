// 依存パッケージ
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EventBody extends StatelessWidget {
  const EventBody({
    Key? key,
    required this.body,
  }) : super(key: key);
  final String body;

  @override
  Widget build(BuildContext context) {
    final screenMaxHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenMaxHeight * 0.6,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(left: 8, right: 8),
      child: TextFormField(
        initialValue: body,
        maxLines: 100,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
