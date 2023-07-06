import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:velneoapp/api/modelos/api_model_partes.dart';
import 'package:velneoapp/views/partes/detalle_de_parte.dart';

class PartesView extends StatefulWidget {
  const PartesView({super.key});

  @override
  State<PartesView> createState() => _PartesViewState();
}

class _PartesViewState extends State<PartesView> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Partes? dataFromAPI;
  _getData() async {
    try {
      String url =
          "https://demoapi.velneo.com/verp-api/vERP_2_dat_dat/v1/vta_ped_g?page%5Bsize%5D=20&fields=id,clt,emp&api_key=api123";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        log("Correcto");
        dataFromAPI = Partes.fromJson(json.decode(res.body));
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
        title: const Text("Partes"),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.all(7.5),
              scrollDirection: Axis.vertical,
              itemCount: dataFromAPI!.vtaPedGs.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setId(dataFromAPI!.vtaPedGs[index].id);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetalleDePartesView()),
                    );
                  },
                  child: ClipPath(
                    clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3))),
                    child: Card(
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
                                    "ID: ${dataFromAPI!.vtaPedGs[index].id}",
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "CLT: ${dataFromAPI!.vtaPedGs[index].clt}",
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "EMP: ${dataFromAPI!.vtaPedGs[index].emp}",
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
