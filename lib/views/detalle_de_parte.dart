import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:velneoapp/api/modelos/api_model_det_partes.dart';
import 'package:velneoapp/api/modelos/api_model_partes.dart';

int idDet = 1;

void setId(int id) {
  idDet = id + 1;
}

class DetalleDePartesView extends StatefulWidget {
  const DetalleDePartesView({super.key});

  //const DetalleDePartesView({super.key});

  @override
  State<DetalleDePartesView> createState() => _DetalleDePartesViewState();
}

class _DetalleDePartesViewState extends State<DetalleDePartesView> {
  bool _isLoaded = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  DetPartes? dataFromAPI;
  _getData() async {
    try {
      String url =
          "https://demoapi.velneo.com/verp-api/vERP_2_dat_dat/v1/vta_ped_g/$idDet?fields=id,clt,emp,emp_div,fch,fch_ent,num_ped&api_key=api123";
      //"https://demoapi.velneo.com/verp-api/vERP_2_dat_dat/v1/vta_ped_g/1?fields=id,clt,emp&api_key=api123";
      http.Response res = await http.get(Uri.parse(url));
      log("001");
      if (res.statusCode == 200) {
        log("jiji");
        dataFromAPI = DetPartes.fromJson(
            json.decode(res.body)); //Partes.fromJson(json.decode(res.body));
        _isLoaded = false;
        log("Lista: ${dataFromAPI!.vtaPedG}");
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
  State<DetalleDePartesView> createState() => _DetalleDePartesViewState();
}

class _DetalleDePartesViewState extends State<DetalleDePartesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle de partes"),
      ),
      body: (_isLoaded)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Row(
                  children: [
                    const Text("ID: "),
                    Text(
                        "${dataFromAPI!.vtaPedG[0].id}"), //TODO debe fallor porque se traga el codigo entero, acortar el enlace el siguiente dia si no revisar el metodo set
                  ],
                ),
                Row(
                  //vtaPedGs.id
                  children: [
                    const Text("CLT: "),
                    Text("${dataFromAPI!.vtaPedG[0].clt}"),
                  ],
                ),
                Row(
                  children: [
                    const Text("EMP: "),
                    Text("${dataFromAPI!.vtaPedG[0].emp}"),
                  ],
                ),
                Row(
                  children: [
                    const Text("EMP div: "),
                    Text("${dataFromAPI!.vtaPedG[0].empDiv}"),
                  ],
                ),
                Row(
                  children: [
                    const Text("FCH: "),
                    Text("${dataFromAPI!.vtaPedG[0].fch}"),
                  ],
                ),
                Row(
                  children: [
                    const Text("FCH ent: "),
                    Text("${dataFromAPI!.vtaPedG[0].fchEnt}"),
                  ],
                ),
                Row(
                  children: [
                    const Text("Num ped: "),
                    Text("${dataFromAPI!.vtaPedG[0].numPed}"),
                  ],
                ),
              ],
            ),
    );
  }
}
