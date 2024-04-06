import 'package:crypto_app/ui/crypto_feed_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto App',
      theme: ThemeData(useMaterial3: true),
      home: const CryptoFeedScreen(),
    );
  }
}
