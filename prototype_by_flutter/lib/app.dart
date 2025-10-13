import 'package:flutter/material.dart';

import 'home/ease_serve_home_page.dart';

class EaseServeApp extends StatelessWidget {
  const EaseServeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EaseServe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F6F8),
        fontFamily: 'Roboto',
      ),
      home: const EaseServeHomePage(),
    );
  }
}
