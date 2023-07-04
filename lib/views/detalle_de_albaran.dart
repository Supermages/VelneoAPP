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

//

class _DetalleDeAlbaranViewState extends State<DetalleDeAlbaranView> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  bool _isLoading = true;

  AlbaranesDeVentaDetalle? dataFromAPI;
  _getData() async {
    try {
      String url =
          "https://demoapi.velneo.com/verp-api/vERP_2_dat_dat/v1/vta_fac_g/3?api_key=api123";
      http.Response res = await http.get(Uri.parse(url));
      log("001");
      if (res.statusCode == 200) {
        log("jiji");
        dataFromAPI = AlbaranesDeVentaDetalle.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      } else {
        throw ("NONOAAAAAAA");
      }
    } catch (e) {
      log("NONO");
      log(e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle de albaranes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text("ID: "),
                Text(dataFromAPI!.vtaFacG.fch as String),
              ],
            ),
            Row(
              children: [
                const Text("CLT: "),
                Text("${dataFromAPI!.vtaFacG.fch}"),
              ],
            ),
            Row(
              children: [
                const Text("EMP: "),
                Text(dataFromAPI!.vtaFacG.totFac as String),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
