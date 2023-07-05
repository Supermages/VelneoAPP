import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:velneoapp/api/modelos/api_model_detalles_de_albaranes.dart';
import 'package:velneoapp/routes/constants.dart';

int index = 0;

setNumeroIndex(numero) {
  index = numero;
}

class DetalleDeAlbaranView extends StatefulWidget {
  const DetalleDeAlbaranView({super.key});

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
          "https://demoapi.velneo.com/verp-api/vERP_2_dat_dat/v1/vta_fac_g/$index?api_key=api123";
      http.Response res = await http.get(Uri.parse(url));
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
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text("Detalle de albaranes"),
              actions: [
                Tooltip(
                  message: "Firmar",
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, condicionesRoute);
                    },
                    icon: const Icon(Icons.history_edu),
                  ),
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text("CLT: "),
                      Text("${dataFromAPI!.vtaFacG[0].clt}"),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("FCH: "),
                      Text("${dataFromAPI!.vtaFacG[0].fch}"),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("NUMFAC: "),
                      Text(dataFromAPI!.vtaFacG[0].numFac),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("TOTFAC: "),
                      Text("${dataFromAPI!.vtaFacG[0].totFac}"),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
