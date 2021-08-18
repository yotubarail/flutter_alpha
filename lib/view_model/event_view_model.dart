import 'package:flutter_riverpod/flutter_riverpod.dart';

final textProvider = StateProvider((ref) => 'hello');

final eventList = StateProvider((ref) => ['勉強会1', '勉強会2', '勉強会3']);

final eventItem = StateProvider((ref) => '勉強会1');
