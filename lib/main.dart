import 'package:flutter/material.dart';
import 'package:velneoapp/views/condiciones.dart';
import 'package:velneoapp/views/entrada.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'VelneoAPP',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
        home: const TerminosPage());
  }
}
