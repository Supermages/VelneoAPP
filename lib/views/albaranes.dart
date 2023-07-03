import 'package:flutter/material.dart';
import "package:velneoapp/api/api_model.dart";

class AlbaranesVentaView extends StatefulWidget {
  const AlbaranesVentaView({super.key});

  @override
  State<AlbaranesVentaView> createState() => _AlbaranesVentaViewState();
}

List<PedVta>? facturasDeVenta;
var isLoaded = false;

class _AlbaranesVentaViewState extends State<AlbaranesVentaView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Albaranes"),
      ),
      body: ListView.builder(
        itemCount: facturasDeVenta?.length,
        itemBuilder: (context, index) {
          return Container(
            child: const Text("Albaran"),
          );
        },
      ),
    );
  }
}
