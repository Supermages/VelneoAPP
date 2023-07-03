import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:velneoapp/routes/constants.dart';
import 'dart:convert';
import "dart:developer";
import 'package:velneoapp/views/ada.dart';

final convertImages = ConvertImages();
String patata = '';
String algo = '';

class FirmaOldPage extends StatefulWidget {
  const FirmaOldPage({Key? key}) : super(key: key);

  @override
  State<FirmaOldPage> createState() => _FirmaOldPageState();
}

class _FirmaOldPageState extends State<FirmaOldPage> {
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
          height: 600,
          width: 370,
          child: Column(children: [
            SfSignaturePad(
              key: _signaturePadStateKey,
              backgroundColor: Colors.grey,
              strokeColor: Colors.black,
              minimumStrokeWidth: 2.5,
              maximumStrokeWidth: 3.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
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
                  // Encodear imagen a base64
                  log("$_signaturePadStateKey");
                  ui.Image image = await _signaturePadStateKey.currentState!
                      .toImage(pixelRatio: 2.0);
                  log("$image");
                  final byteData =
                      await image.toByteData(format: ui.ImageByteFormat.png);
                  log("$byteData");
                  final Uint8List imageBytes = byteData!.buffer.asUint8List(
                      byteData.offsetInBytes, byteData.lengthInBytes);
                  //if(){
                  if (kIsWeb) {
                    AnchorElement(
                        href:
                            'data:application/octet-stream;charset=utf-161e;base64,${base64.encode(imageBytes)}')
                      ..setAttribute('download', 'Firma.png')
                      ..click();
                    log("$imageBytes");
                    String patata = base64.encode(imageBytes);
                    print(patata);
                    // Decodear base64 a imagen
                    //log("Estoy aqui => ${metodo.convertUbFileBase64(fileName)}");
                  } else {
                    final String path =
                        (await getApplicationSupportDirectory()).path;
                    final String fileName = '$path/Firma.png';
                    log("Estoy aqui => ${metodo.convertUbFileBase64(fileName)}");
                    final File file = File(fileName);
                    await file.writeAsBytes(imageBytes, flush: true);
                    OpenFile.open(fileName);
                  }
                  //}
                  Navigator.pushNamed(context, eleccionRoute);
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
