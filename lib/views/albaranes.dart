import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import "package:velneoapp/api/api_model.dart";
import 'package:velneoapp/routes/constants.dart';

class AlbaranesVentaView extends StatefulWidget {
  const AlbaranesVentaView({super.key});

  @override
  State<AlbaranesVentaView> createState() => _AlbaranesVentaViewState();
}

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
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                  text: "Albaranes",
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, detalleDeAlbaranesRoute);
                    }),
            ),
          );
        },
      ),
    );
  }
}
