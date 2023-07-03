import 'package:flutter/material.dart';

class DetalleDePartesView extends StatefulWidget {
  final int id;

  const DetalleDePartesView({super.key, required this.id});

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [Text("${widget.id}")],
        ),
      ),
    );
  }
}
