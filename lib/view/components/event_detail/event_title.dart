// 依存パッケージ
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EventTitle extends StatelessWidget {
  const EventTitle({
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
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
