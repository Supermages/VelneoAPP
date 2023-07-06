import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:velneoapp/api/modelos/api_img.dart';
import 'package:velneoapp/api/modelos/api_model_det_partes.dart';
import 'package:velneoapp/api/modelos/api_post_detalle_de_parte.dart';
import 'package:velneoapp/images/boton_imagen.dart';
import 'package:velneoapp/dialogos/delete_file.dart';
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
      log("NONO ewrror => ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    IdImg().setIdImg(idDet);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle de partes"),
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
      body: (_isLoading)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 192, 187, 187), Colors.grey],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            const Text("ID: "),
                            Text("${dataFromAPI!.vtaPedG[0].id}"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          //vtaPedGs.id
                          children: [
                            const Text("CLT: "),
                            Text("${dataFromAPI!.vtaPedG[0].clt}"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            const Text("EMP: "),
                            Text(dataFromAPI!.vtaPedG[0].emp),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            const Text("EMP div: "),
                            Text(dataFromAPI!.vtaPedG[0].empDiv),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            const Text("FCH: "),
                            Text("${dataFromAPI!.vtaPedG[0].fch}"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            const Text("FCH ent: "),
                            Text("${dataFromAPI!.vtaPedG[0].fchEnt}"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            const Text("Num ped: "),
                            Text(dataFromAPI!.vtaPedG[0].numPed),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Divider(
                            color: Color.fromARGB(255, 221, 219, 219),
                            thickness: 4),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.delete),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red),
                            ),
                            onPressed: () async {
                              final shouldExitToScreen =
                                  await showDeleteFileDialog(context);
                              if (shouldExitToScreen) {
                                log("id: $idDet");
                                var response = await http.delete(Uri.parse(
                                    "https://demoapi.velneo.com/verp-api/vERP_2_dat_dat/v1/vta_ped_g/$idDet?api_key=api123"));
                                if (response.statusCode == 200) {
                                  log('Dato eliminado');
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      eleccionRoute, (route) => false);
                                } else {
                                  log('Error al eliminar el dato');
                                }
                              }
                            },
                            label: const Text("Borrar"),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.send),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                          ),
                          onPressed: () {
                            log("id: $idDet");
                            //Post._postData(idDet: idDet, emp: "002", emp_div: "002");
                            Post post = const Post();
                            post.postData(
                                idDet: idDet, emp: "002", empdiv: "002");
                          },
                          label: const Text("Post (No funcional)"),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                            color: Colors.black,
                            width: 3,
                          ),
                        ),
                        child: BottonImage(id: idDet),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
