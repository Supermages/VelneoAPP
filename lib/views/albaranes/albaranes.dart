import 'package:flutter/material.dart';
import 'package:velneoapp/api/modelos/api_model_albaranes.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:velneoapp/views/albaranes/detalle_de_albaran.dart';

class AlbaranesVentaView extends StatefulWidget {
  const AlbaranesVentaView({super.key});

  @override
  State<AlbaranesVentaView> createState() => _AlbaranesVentaViewState();
}

class _AlbaranesVentaViewState extends State<AlbaranesVentaView> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  AlbaranesVenta? dataFromAPI;
  _getData() async {
    try {
      String url =
          "https://demoapi.velneo.com/verp-api/vERP_2_dat_dat/v1/vta_fac_g?page%5Bsize%5D=20&api_key=api123";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        log("Correcto");
        dataFromAPI = AlbaranesVenta.fromJson(json.decode(res.body));
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Albaranes"),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.all(7.5),
              itemCount: dataFromAPI!.vtaFacG.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    try {
                      log("${index + 2}");
                      setNumeroIndex(index + 2);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetalleDeAlbaranView(),
                        ),
                      );
                    } catch (e) {
                      log(e.toString());
                    }
                  },
                  child: Card(
                    child: ClipPath(
                      clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(color: Colors.green, width: 5),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "FCH: ${dataFromAPI!.vtaFacG[index].fch}",
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "numFac: ${dataFromAPI!.vtaFacG[index].numFac}",
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "CLT: ${dataFromAPI!.vtaFacG[index].clt}",
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "totFac: ${dataFromAPI!.vtaFacG[index].totFac}",
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Firmado " "${index + 1}",
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
