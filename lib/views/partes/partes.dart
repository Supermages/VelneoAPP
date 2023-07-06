import 'dart:async';
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

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      const Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

class _PartesViewState extends State<PartesView> {
  Partes? dataFromAPI;
  final _debouncer = Debouncer();
  bool _isLoading = true;
  List<Prt> valores = [];
  @override
  void initState() {
    _getData();
    setState(() {});
    super.initState();
  }

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
    valores = dataFromAPI!.vtaPedGs;
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
                      hintText: 'Buscar...',
                    ),
                    onChanged: (string) {
                      _debouncer.run(() {
                        setState(() {
                          valores = dataFromAPI!.vtaPedGs
                              .where(
                                (u) => (u.id
                                        .toString()
                                        .toLowerCase()
                                        .contains(string.toLowerCase()) ||
                                    u.clt
                                        .toString()
                                        .toLowerCase()
                                        .contains(string.toLowerCase()) ||
                                    u.emp
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
                          setId(dataFromAPI!.vtaPedGs[index].id);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const DetalleDePartesView()),
                          );
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
                                  left:
                                      BorderSide(color: Colors.green, width: 5),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "ID: ${valores[index].id}",
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      "Cliente: ${valores[index].clt}",
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      "Empresa: ${valores[index].emp}",
                                      style: const TextStyle(fontSize: 16),
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
                ),
              ],
            ),
    );
  }
}
