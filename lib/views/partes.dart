import 'dart:convert';
import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "package:velneoapp/api/api_model.dart";
import 'package:velneoapp/api/api_prueba.dart';
import 'package:velneoapp/routes/constants.dart';

class PartesView extends StatefulWidget {
  const PartesView({super.key});

  @override
  State<PartesView> createState() => _PartesViewState();
}

class _PartesViewState extends State<PartesView> {
  bool _isLoaded = true;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  void dispose() {
    super.dispose();
    _getData();
  }

  FacturasDeVenta? dataFromAPI;
  _getData() async {
    try {
      String url =
          "https://demoapi.velneo.com/verp-api/vERP_2_dat_dat/v1/vta_ped_g?page%5Bsize%5D=20&fields=id,clt,emp&api_key=api123";
      http.Response res = await http.get(Uri.parse(url));
      log("${res.statusCode}");
      if (res.statusCode == 200) {
        print("jiji");
        dataFromAPI = await FacturasDeVenta.fromJson(json.decode(res.body));
        _isLoaded = false;
        setState(() {});
      } else {
        throw ("NONOAAAAAAA");
      }
    } catch (e) {
      print("NONO");
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Partes"),
      ),
      body: _isLoaded
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("\$${dataFromAPI!.vtaPedGs[index].id.toString()}"),
                      Text("\$${dataFromAPI!.vtaPedGs[index].clt.toString()}"),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
