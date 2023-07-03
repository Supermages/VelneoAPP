import 'package:flutter/material.dart';
import "package:velneoapp/api/api_model.dart";
import 'package:velneoapp/api/api_que%20_funciona.dart';

var api;
Map map = {};

class AlbaranesVentaView extends StatefulWidget {
  const AlbaranesVentaView({super.key});

  @override
  State<AlbaranesVentaView> createState() => _AlbaranesVentaViewState();
}

List<PedVta>? facturasDeVenta;
var isLoaded = false;

class _AlbaranesVentaViewState extends State<AlbaranesVentaView> {
  @override
  void initState() async {
    super.initState();
    initApi();
  }

  Future<void> initApi() async {
    api = await Api.createAsync(
        'https://demoapi.velneo.com/verp-api/vERP_2_dat_dat/v1/vta_ped_g?page%5Bsize%5D=20&fields=id,clt,emp&api_key=api123');
    map = api.mapApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Albaranes"),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          try {
            return Text("id: ${map["vta_ped_g"][index]["id"]}");
          } catch (e) {
            return Text("$e");
          }
        },
      ),
    );
  }
}
