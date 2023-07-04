import 'package:flutter/material.dart';
import 'package:velneoapp/views/albaranes.dart';
import 'package:velneoapp/views/condiciones.dart';
import 'package:velneoapp/views/detalle_de_albaran.dart';
import 'package:velneoapp/views/detalle_de_parte.dart';
import 'package:velneoapp/views/eleccion.dart';
import 'package:velneoapp/views/entrada.dart';
import 'package:velneoapp/views/firma.dart';
import 'package:velneoapp/views/partes.dart';
import 'package:velneoapp/routes/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'VelneoAPP',
        routes: {
          partesRoute: (context) => const PartesView(),
          albaranesRoute: (context) => const AlbaranesVentaView(),
          entradaRoute: (context) => const EntradaView(),
          eleccionRoute: (context) => const EleccionView(),
          firmaRoute: (context) => const FirmaView(),
          detalleDeAlbaranesRoute: (context) => const DetalleDeAlbaranView(),
          detalleDePartesRoute: (context) => const DetalleDePartesView(
                id: 3,
              ),
        },
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
        home: const TerminosPage());
  }
}
