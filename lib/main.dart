import 'package:flutter/material.dart';
import 'package:velneoapp/views/albaranes/albaranes.dart';
import 'package:velneoapp/views/condiciones.dart';
import 'package:velneoapp/views/configuracion.dart';
import 'package:velneoapp/views/albaranes/detalle_de_albaran.dart';
import 'package:velneoapp/views/partes/detalle_de_parte.dart';
import 'package:velneoapp/views/eleccion.dart';
import 'package:velneoapp/views/entrada.dart';
import 'package:velneoapp/views/firma.dart';
import 'package:velneoapp/views/partes/partes.dart';
import 'package:velneoapp/routes/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;
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
          detalleDePartesRoute: (context) => const DetalleDePartesView(),
          condicionesRoute: (context) => const CondicionesView(),
          configRoute: (context) => const ConfigView(),
        },
        theme: ThemeData(),
        darkTheme: ThemeData.dark(),
        themeMode: _themeMode,
        home: const EntradaView());
  }

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }
}
