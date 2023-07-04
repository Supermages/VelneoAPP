import 'package:flutter/material.dart';
import 'package:velneoapp/api/modelos/api_model_albaranes.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:velneoapp/views/detalle_de_albaran.dart';

class AlbaranesVentaView extends StatefulWidget {
  const AlbaranesVentaView({super.key});

  @override
  State<AlbaranesVentaView> createState() => _AlbaranesVentaViewState();
}

class _AlbaranesVentaViewState extends State<AlbaranesVentaView> {
  bool _isLoaded = true;

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
      log("001");
      if (res.statusCode == 200) {
        log("jiji");
        dataFromAPI = AlbaranesVenta.fromJson(json.decode(res.body));
        _isLoaded = false;
        setState(() {});
      } else {
        throw ("DON");
      }
    } catch (e) {
      log("NO");
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
        title: const Text("Albaranes"),
      ),
      body: _isLoaded
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: dataFromAPI!.vtaFacG.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetalleDeAlbaranView(
                                  index: dataFromAPI!.vtaFacG[index] as int,
                                )),
                      );
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text("FCH: "),
                            Text("${dataFromAPI!.vtaFacG[index].fch}"),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("numFac: "),
                            Text(dataFromAPI!.vtaFacG[index].numFac),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("CLT: "),
                            Text("${dataFromAPI!.vtaFacG[index].clt}"),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("totFac: "),
                            Text("${dataFromAPI!.vtaFacG[index].totFac}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
