import 'dart:async';

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

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

class _AlbaranesVentaViewState extends State<AlbaranesVentaView> {
  AlbaranesVenta? dataFromAPI;
  bool _isLoading = true;
  final _debouncer = Debouncer();
  List<VtaFacG> valores = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    try {
      String url =
          "https://demoapi.velneo.com/verp-api/vERP_2_dat_dat/v1/vta_fac_g?page%5Bsize%5D=20&api_key=api123";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        log("Correcto");
        dataFromAPI = AlbaranesVenta.fromJson(json.decode(res.body));
        _isLoading = false;
        valores = dataFromAPI!.vtaFacG;
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
          : Column(
              children: <Widget>[
                //Search Bar to List of typed Subject
                Container(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      suffixIcon: const InkWell(
                        child: Icon(Icons.search),
                      ),
                      contentPadding: const EdgeInsets.all(15.0),
                      hintText: 'Search ',
                    ),
                    onChanged: (string) {
                      _debouncer.run(() {
                        setState(() {
                          valores = dataFromAPI!.vtaFacG
                              .where(
                                (u) => (u.clt
                                        .toString()
                                        .toLowerCase()
                                        .contains(string.toLowerCase()) ||
                                    u.numFac
                                        .toLowerCase()
                                        .contains(string.toLowerCase())),
                              )
                              .toList();
                        });
                        log("valores: $valores");
                      });
                    }, //toLowerCase().contains(
                    //string.toLowerCase(),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.all(5),
                    itemCount: valores.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setNumeroIndex(int.parse(valores[index]
                              .numFac
                              .substring(valores[index].numFac.length - 2)));
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const DetalleDeAlbaranView(),
                            ),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "ID: ${valores[index].fch}",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "Numero factura: ${valores[index].numFac}",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "Cliente: ${valores[index].clt}",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "Total factura: ${valores[index].totFac}",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "Firmado: ${index + 1}",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
