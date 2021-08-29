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
    final screenMaxWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenMaxHeight * 0.6,
      width: screenMaxWidth,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        body,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
