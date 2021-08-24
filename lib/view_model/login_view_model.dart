// 依存パッケージ
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailProvider = StateProvider.autoDispose((ref) {
  return 'test@test.com';
});

final passwordProvider = StateProvider.autoDispose((ref) {
  return 'P@ssw0rd';
});
