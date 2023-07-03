// To parse this JSON data, do
//
// final facturasDeVenta = facturasDeVentaFromJson(jsonString);

import 'dart:convert';

Partes partesFromJson(String str) => Partes.fromJson(json.decode(str));

String partesToJson(Partes data) => json.encode(data.toJson());

class Partes {
  int count;
  int totalCount;
  List<Prt> vtaPedGs;

  Partes({
    required this.count,
    required this.totalCount,
    required this.vtaPedGs,
  });

  factory Partes.fromJson(Map<String, dynamic> json) => Partes(
        count: json["count"],
        totalCount: json["total_count"],
        vtaPedGs: List<Prt>.from(json["vta_ped_g"].map((x) => Prt.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "total_count": totalCount,
        "vtaPedGs": List<dynamic>.from(vtaPedGs.map((x) => x.toJson())),
      };
}

class Prt {
  int id;
  int clt;
  String emp;

  Prt({
    required this.id,
    required this.clt,
    required this.emp,
  });

  factory Prt.fromJson(Map<String, dynamic> json) => Prt(
        id: json["id"],
        clt: json["clt"],
        emp: json["emp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "clt": clt,
        "emp": emp,
      };
}
