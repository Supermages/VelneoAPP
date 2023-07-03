import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:velneoapp/api/modelos/api_model_detalles_de_albaranes.dart';

class DetalleDeAlbaranView extends StatefulWidget {
  const DetalleDeAlbaranView({super.key, required this.index});
  final int index;
  @override
  State<DetalleDeAlbaranView> createState() => _DetalleDeAlbaranViewState();
}

class _DetalleDeAlbaranViewState extends State<DetalleDeAlbaranView> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  bool _isLoaded = false;

  AlbaranesDeVentaDetalle? dataFromAPI;
  _getData() async {
    try {
      String url =
          "https://demoapi.velneo.com/verp-api/vERP_2_dat_dat/v1/vta_fac_g/3?api_key=api123";
      http.Response res = await http.get(Uri.parse(url));
      log(res.body);
      if (res.statusCode == 200) {
        log("hecho");
        dataFromAPI = AlbaranesDeVentaDetalle.fromJson(json.decode(res.body));
        _isLoaded = true;
        setState(() {});
      } else {
        throw ("Error during connection");
      }
    } catch (e) {
      log("Error");
      print(e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoaded
        ? Scaffold(
            appBar: AppBar(
              title: const Text("Detalle de albaranes"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text("TOTFAC: "),
                      Text("${dataFromAPI!.vtaFacG[0].clt}"),
                    ],
                  ),
                ],
              ),
            ),
          )
        : Container();
  }
}
