import 'package:flutter/material.dart';

import 'ui/utils/app_theme.dart';
import 'ui/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Comic Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const HomePage()
    );
  }
}
