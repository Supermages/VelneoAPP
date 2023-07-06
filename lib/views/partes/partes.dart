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
      log("001");
      if (res.statusCode == 200) {
        log("jiji");
        dataFromAPI = Partes.fromJson(json.decode(res.body));
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
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 195, 179, 179),
                            Color.fromARGB(255, 117, 141, 154)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text("ID: "),
                                Text("${dataFromAPI!.vtaPedGs[index].id}"),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("CLT: "),
                                Text("${dataFromAPI!.vtaPedGs[index].clt}"),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("EMP: "),
                                Text(dataFromAPI!.vtaPedGs[index].emp),
                              ],
                            ),
                          ],
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
