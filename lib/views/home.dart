import 'package:flutter/material.dart';
import "package:velneoapp/api/api_model.dart";
import 'package:velneoapp/api/api_remote_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<PedVta>? facturasDeVenta;
var isLoaded = false;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Próximamente."),
      ),
      body: ListView.builder(
        itemCount: facturasDeVenta?.length,
        itemBuilder: (context, index) {
          return Container(
            child: const Text("Ejemplo"),
          );
        },
      ),
    );
  }
}
