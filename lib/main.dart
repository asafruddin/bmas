import 'dart:async';

import 'package:bmas/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:bmas/core/injector_container.dart' as di;

void main() {
  runZonedGuarded(() async {
    await di.init();
    runApp(const MainApp());
  }, (error, stack) {});
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}
