import 'dart:ui' as ui;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:velneoapp/routes/constants.dart';
import 'dart:convert';
import "dart:developer";
import 'dart:typed_data';

convertirImagen(context, _signaturePadStateKey, metodo) async {
  log("${_signaturePadStateKey.currentState}");
  ui.Image image =
      await _signaturePadStateKey.currentState!.toImage(pixelRatio: 2.0);
  log("$image");
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  // comprobar si esta vacio o no
  log("${byteData!.offsetInBytes}");
  if (byteData.lengthInBytes == 2557 || byteData.lengthInBytes == 2619) {
    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('No se ha podido continuar'),
        content: const Text(
          'Porfavor, ponga su firma para continuar.',
        ),
        actions: [
          ElevatedButton.icon(
            icon: const Icon(Icons.check),
            onPressed: () {
              Navigator.pop(context);
            },
            label: const Text('Aceptar'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            ),
          ),
        ],
      ),
    );
  } else {
    log("${byteData.lengthInBytes}");
    final Uint8List imageBytes = byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
    //if(){
    if (kIsWeb) {
      AnchorElement(
          href:
              'data:application/octet-stream;charset=utf-161e;base64,${base64.encode(imageBytes)}')
        ..setAttribute('download', 'Firma.png')
        ..click();
      log("$imageBytes");
      String patata = base64.encode(imageBytes);
      log(patata);
      // Decodear base64 a imagen
      //log("Estoy aqui => ${metodo.convertUbFileBase64(fileName)}");
    } else {
      final String path = (await getApplicationSupportDirectory()).path;
      final String fileName = '$path/Firma.png';
      log("Estoy aqui => ${metodo.convertUbFileBase64(fileName)}");
      final File file = File(fileName);
      await file.writeAsBytes(imageBytes, flush: true);
      OpenFile.open(fileName);
    }
    //}
    Navigator.pushNamedAndRemoveUntil(context, eleccionRoute, (route) => false);
  }
}
                    // Encodear imagen a base64


 