import 'package:flutter/material.dart';

class DetalleDePartesView extends StatelessWidget {
  final int id;

  const DetalleDePartesView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle de partes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [Text("$id")],
        ),
      ),
    );
  }
}
