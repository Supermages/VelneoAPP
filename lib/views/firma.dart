import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:velneoapp/dialogos/error_dialog.dart';
import 'package:velneoapp/image/convert_images.dart';
import 'package:velneoapp/images/convertimages.dart';

const convertImages = ConvertImages();
String patata = '';
String algo = '';

class FirmaView extends StatefulWidget {
  const FirmaView({Key? key}) : super(key: key);

  @override
  State<FirmaView> createState() => _FirmaViewState();
}

class _FirmaViewState extends State<FirmaView> {
  @override
  void initState() {
    super.initState();
  }

  bool _thereIsSignature = false;
  final metodo = const ConvertImages();
  final GlobalKey<SfSignaturePadState> _signaturePadStateKey = GlobalKey();
  Offset offsetValue = const Offset(0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firma")),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Text(
                'Por favor, firme aquí para continuar',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SfSignaturePad(
              key: _signaturePadStateKey,
              backgroundColor: Colors.grey,
              strokeColor: Colors.black,
              minimumStrokeWidth: 2.5,
              maximumStrokeWidth: 3.0,
              onDraw: (offset, time) {
                offsetValue = offset;
                log("$offsetValue");
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ElevatedButton.icon(
                  onPressed: () async {
                    _thereIsSignature = false;
                    offsetValue = const Offset(0, 0);
                    _signaturePadStateKey.currentState!.clear();
                  },
                  icon: const Icon(
                    Icons.delete,
                    size: 24.0,
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  label: const Text('Borrar')),
            ),
            Text(patata),
            ElevatedButton.icon(
                onPressed: () async {
                  log("$offsetValue");
                  if (offsetValue == Offset.zero) {
                    showErrorDialog(
                      context,
                      "Debes de poner tu firma para continuar",
                    );
                  } else {
                    await convertirImagen(
                        context, _signaturePadStateKey, metodo);
                  }
                },
                icon: const Icon(
                  Icons.image,
                  size: 24.0,
                ),
                label: const Text('Firmar y guardar')),
          ]),
        ),
      ),
    );
  }
}
