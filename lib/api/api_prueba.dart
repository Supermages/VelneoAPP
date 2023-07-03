import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:velneoapp/api/api_model.dart';

Future<VtaPedG> fetchVtaPedG() async {
  var response = await http.get(Uri.parse(
      "https://demoapi.velneo.com/verp-api/vERP_2_dat_dat/v1/vta_ped_g?page%5Bsize%5D=20&fields=id,clt,emp&api_key=api123"));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return VtaPedG.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load pedidos');
  }
}

PedidosDeVenta pedidosDeVentaFromJson(String str) =>
    PedidosDeVenta.fromJson(json.decode(str));

String pedidosDeVentaToJson(PedidosDeVenta data) => json.encode(data.toJson());

class PedidosDeVenta {
  int count;
  int totalCount;
  List<VtaPedG> vtaPedG;

  PedidosDeVenta({
    required this.count,
    required this.totalCount,
    required this.vtaPedG,
  });

  factory PedidosDeVenta.fromJson(Map<String, dynamic> json) => PedidosDeVenta(
        count: json["count"],
        totalCount: json["total_count"],
        vtaPedG: List<VtaPedG>.from(
            json["vta_ped_g"].map((x) => VtaPedG.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "total_count": totalCount,
        "vta_ped_g": List<dynamic>.from(vtaPedG.map((x) => x.toJson())),
      };
}

class VtaPedG {
  final int id;
  final String clt;
  final int emp;

  const VtaPedG({
    required this.id,
    required this.clt,
    required this.emp,
  });

  factory VtaPedG.fromJson(Map<String, dynamic> json) {
    return VtaPedG(
      id: json['id'],
      clt: json['clt'],
      emp: json['emp'],
    );
  }
}

void main() => runApp(const MyAppp());

class MyAppp extends StatefulWidget {
  const MyAppp({super.key});

  @override
  State<MyAppp> createState() => _MyApppState();
}

class _MyApppState extends State<MyAppp> {
  late Future<VtaPedG> futureVtaPedG;

  @override
  void initState() {
    super.initState();
    futureVtaPedG = fetchVtaPedG();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Partes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Partes'),
        ),
        body: Center(
          child: FutureBuilder<VtaPedG>(
            future: futureVtaPedG,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.emp);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
