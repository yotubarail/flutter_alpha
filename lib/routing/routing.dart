import 'package:flutter/material.dart';
import 'package:flutter_alpha/view/login_view.dart';
import 'package:flutter_alpha/view/event_view.dart';
import 'package:flutter_alpha/view/detail_view.dart';

Map<String, Widget Function(BuildContext)> routing(BuildContext context) {
  final paths = {
    '/': (BuildContext context) => const Login(),
    '/events': (BuildContext context) => const Events(),
    '/detail': (BuildContext context) => const Detail(),
  };
  return paths;
}
