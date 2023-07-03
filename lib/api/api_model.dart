// To parse this JSON data, do
//
//     final facturasDeVenta = facturasDeVentaFromJson(jsonString);

import 'dart:convert';

FacturasDeVenta facturasDeVentaFromJson(String str) =>
    FacturasDeVenta.fromJson(json.decode(str));

String facturasDeVentaToJson(FacturasDeVenta data) =>
    json.encode(data.toJson());

class FacturasDeVenta {
  int count;
  int totalCount;
  List<VtaPedG> vtaPedGs;

  FacturasDeVenta({
    required this.count,
    required this.totalCount,
    required this.vtaPedGs,
  });

  factory FacturasDeVenta.fromJson(Map<String, dynamic> json) =>
      FacturasDeVenta(
        count: json["count"],
        totalCount: json["total_count"],
        vtaPedGs: List<VtaPedG>.from(
            json["vta_ped_g"].map((x) => VtaPedG.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "total_count": totalCount,
        "vtaPedGs": List<dynamic>.from(vtaPedGs.map((x) => x.toJson())),
      };
}

class VtaPedG {
  int id;
  int clt;
  String emp;

  VtaPedG({
    required this.id,
    required this.clt,
    required this.emp,
  });

  factory VtaPedG.fromJson(Map<String, dynamic> json) => VtaPedG(
        id: json["id"] as int,
        clt: json["clt"] as int,
        emp: json["emp"] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "clt": clt,
        "emp": emp,
      };
}
