import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
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

  final metodo = const ConvertImages();
  final GlobalKey<SfSignaturePadState> _signaturePadStateKey = GlobalKey();
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
              padding: EdgeInsets.all(16.0),
              child: Text('Porfavor, firme aqui para continuar'),
            ),
            SfSignaturePad(
              key: _signaturePadStateKey,
              backgroundColor: Colors.grey,
              strokeColor: Colors.black,
              minimumStrokeWidth: 2.5,
              maximumStrokeWidth: 3.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ElevatedButton.icon(
                  onPressed: () async {
                    _signaturePadStateKey.currentState!.clear();
                  },
                  icon: const Icon(
                    Icons.delete,
                    size: 24.0,
                  ),
                  label: const Text('Borrar')),
            ),
            Text(patata),
            ElevatedButton.icon(
                onPressed: () async {
                  await convertirImagen(context, _signaturePadStateKey, metodo);
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
