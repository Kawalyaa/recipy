import 'package:flutter/material.dart';

import 'fooderlich_theme.dart';
import 'home.dart';

void main() {
  runApp(const Recipy2());
}

class Recipy2 extends StatelessWidget {
  const Recipy2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.light();
    return MaterialApp(
      theme: theme,
      title: 'Recipy2',
      home: const Home(),
    );
  }
}
