import 'package:flutter/material.dart';

class DetalleDePartesView extends StatefulWidget {
  const DetalleDePartesView({super.key});

  @override
  State<DetalleDePartesView> createState() => _DetalleDePartesViewState();
}

class _DetalleDePartesViewState extends State<DetalleDePartesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle de partes"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [Text("Hola")],
        ),
      ),
    );
  }
}
