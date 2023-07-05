import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:velneoapp/api/modelos/api_img.dart';
import 'package:velneoapp/api/modelos/api_model_det_partes.dart';
import 'package:velneoapp/api/modelos/post_detalle_de_parte.dart';
import 'package:velneoapp/elementos_creados/botonImagen.dart';
import 'package:velneoapp/routes/constants.dart';

int idDet = 1;

void setId(int id) {
  idDet = id;
}

class DetalleDePartesView extends StatefulWidget {
  const DetalleDePartesView({super.key});

  //const DetalleDePartesView({super.key});

  @override
  State<DetalleDePartesView> createState() => _DetalleDePartesViewState();
}

class _DetalleDePartesViewState extends State<DetalleDePartesView> {
  bool _isLoading = true;
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
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFromAPI = DetPartes.fromJson(json.decode(res.body));
        _isLoading = false;
        log("(jiji) Lista: ${dataFromAPI!.vtaPedG}");
        //_postData(3, "Si estas", "leyendo esto", null, null,
        //    "WTF amico te advierot que dejes de leer", 13);
        setState(() {});
      } else {
        throw ("NONOAAAAAAA");
      }
    } catch (e) {
      log("NONO${e.toString()}");
    }
  }

  @override
  void dispose() {
    super.dispose();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    IdImg().setIdImg(idDet);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle de partes"),
      ),
      body: (_isLoading)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Row(
                  children: [
                    const Text("ID: "),
                    Text("${dataFromAPI!.vtaPedG[0].id}"),
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
                    Text(dataFromAPI!.vtaPedG[0].emp),
                  ],
                ),
                Row(
                  children: [
                    const Text("EMP div: "),
                    Text(dataFromAPI!.vtaPedG[0].empDiv),
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
                    Text(dataFromAPI!.vtaPedG[0].numPed),
                  ],
                ),
                ElevatedButton(
                  onPressed: () async {
                    log("id: $idDet");
                    var response = await http.delete(Uri.parse(
                        "https://demoapi.velneo.com/verp-api/vERP_2_dat_dat/v1/vta_ped_g/$idDet?api_key=api123"));
                    if (response.statusCode == 200) {
                      print('Dato eliminado');
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          eleccionRoute, (route) => false);
                    } else {
                      print('Error al eliminar el dato');
                    }
                  },
                  child: const Text("Delete"),
                ),
                ElevatedButton(
                  onPressed: () {
                    log("id: $idDet");
                    //Post._postData(idDet: idDet, emp: "002", emp_div: "002");
                    Post post = const Post();
                    post.postData(idDet: idDet, emp: "002", emp_div: "002");
                  },
                  child: const Text("Post (No funcional)"),
                ),
                BottonImage(id: idDet),
                //eliminar
              ],
            ),
    );
  }
}
