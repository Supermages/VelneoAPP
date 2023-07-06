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
        log("Correcto");
        dataFromAPI = AlbaranesDeVentaDetalle.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      } else {
        log("${res.statusCode}");
        throw ("Error durante la conexión");
      }
    } catch (e) {
      log("Error antes de conectarse => ${e.toString()}");
    }
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
              padding: const EdgeInsets.all(12.0),
              child: ClipPath(
                clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3))),
                child: Card(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.23,
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                            color: Color.fromARGB(255, 53, 170, 57), width: 5),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("CLT: ${dataFromAPI!.vtaFacG[0].clt}"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("FCH: ${dataFromAPI!.vtaFacG[0].fch}"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                    "numFac: ${dataFromAPI!.vtaFacG[0].numFac}"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                    "totFac: ${dataFromAPI!.vtaFacG[0].totFac}"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
