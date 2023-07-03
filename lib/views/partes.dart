import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import "package:velneoapp/api/api_model.dart";
import 'package:velneoapp/api/api_prueba.dart';
import 'package:velneoapp/routes/constants.dart';

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
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                  text: "Partes",
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, detalleDePartesRoute);
                    }),
            ),
          );
        },
      ),
    );
  }
}
