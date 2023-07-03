// To parse this JSON data, do
//
//     final albaranesVenta = albaranesVentaFromJson(jsonString);

import 'dart:convert';

AlbaranesVenta albaranesVentaFromJson(String str) =>
    AlbaranesVenta.fromJson(json.decode(str));

String albaranesVentaToJson(AlbaranesVenta data) => json.encode(data.toJson());

class AlbaranesVenta {
  int count;
  int totalCount;
  List<VtaFacG> vtaFacG;

  AlbaranesVenta({
    required this.count,
    required this.totalCount,
    required this.vtaFacG,
  });

  factory AlbaranesVenta.fromJson(Map<String, dynamic> json) => AlbaranesVenta(
        count: json["count"],
        totalCount: json["total_count"],
        vtaFacG: List<VtaFacG>.from(
            json["vta_fac_g"].map((x) => VtaFacG.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "total_count": totalCount,
        "vta_fac_g": List<dynamic>.from(vtaFacG.map((x) => x.toJson())),
      };
}

class VtaFacG {
  DateTime fch;
  String numFac;
  int clt;
  double totFac;

  VtaFacG({
    required this.fch,
    required this.numFac,
    required this.clt,
    required this.totFac,
  });

  factory VtaFacG.fromJson(Map<String, dynamic> json) => VtaFacG(
        fch: DateTime.parse(json["fch"]),
        numFac: json["num_fac"],
        clt: json["clt"],
        totFac: json["tot_fac"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "fch": fch.toIso8601String(),
        "num_fac": numFac,
        "clt": clt,
        "tot_fac": totFac,
      };
}
