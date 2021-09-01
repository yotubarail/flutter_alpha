// 依存パッケージ
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GuestCount extends StatelessWidget {
  const GuestCount({
    Key? key,
    required this.guestCount,
  }) : super(key: key);
  final int guestCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Text(
          '申し込み数：$guestCount人',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
