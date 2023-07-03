import 'package:flutter/material.dart';

class DetalleDeAlbaranView extends StatefulWidget {
  const DetalleDeAlbaranView({super.key, required index});

  @override
  State<DetalleDeAlbaranView> createState() => _DetalleDeAlbaranViewState();
}

class _DetalleDeAlbaranViewState extends State<DetalleDeAlbaranView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle de albaranes"),
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
