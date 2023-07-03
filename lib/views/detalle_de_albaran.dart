import 'package:flutter/material.dart';

class DetalleDeAlbaranView extends StatefulWidget {
  const DetalleDeAlbaranView({super.key});

  @override
  State<DetalleDeAlbaranView> createState() => _DetalleDeAlbaranViewState();
}

// https://demoapi.velneo.com/verp-api/vERP_2_dat_dat/v1/vta_fac_g/2?api_key=api123

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
