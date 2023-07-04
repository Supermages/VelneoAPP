import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:velneoapp/api/modelos/api_model_partes.dart';
import 'package:velneoapp/views/detalle_de_parte.dart';

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
  void dispose() {
    super.dispose();
    _getData();
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
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetalleDePartesView(
                                  id: dataFromAPI!.vtaPedGs[index].id,
                                )),
                      );
                    },
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
                );
              },
            ),
    );
  }
}
