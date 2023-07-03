import 'package:flutter/material.dart';
import "package:velneoapp/api/api_model.dart";

class PartesView extends StatefulWidget {
  const PartesView({super.key});

  @override
  State<PartesView> createState() => _PartesViewState();
}

List<PedVta>? facturasDeVenta;
var isLoaded = false;

class _PartesViewState extends State<PartesView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Partes"),
      ),
      body: ListView.builder(
        itemCount: facturasDeVenta?.length,
        itemBuilder: (context, index) {
          return Container(
            child: const Text("Partes"),
          );
        },
      ),
    );
  }
}
