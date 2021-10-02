import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:shoes/src/models/shoe_model.dart';
import 'package:shoes/src/pages/shoe_page.dart';

void main() {
  return runApp(
    ChangeNotifierProvider(
      create: (_) => ShoeModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shoes App',
      debugShowCheckedModeBanner: false,
      home: ShoePage(),
    );
  }
}
