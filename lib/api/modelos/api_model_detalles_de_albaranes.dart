// To parse this JSON data, do
//
//     final albaranesDeVentaDetalle = albaranesDeVentaDetalleFromJson(jsonString);

import 'dart:convert';

AlbaranesDeVentaDetalle albaranesDeVentaDetalleFromJson(String str) =>
    AlbaranesDeVentaDetalle.fromJson(json.decode(str));

String albaranesDeVentaDetalleToJson(AlbaranesDeVentaDetalle data) =>
    json.encode(data.toJson());

class AlbaranesDeVentaDetalle {
  VtaFacG vtaFacG;

  AlbaranesDeVentaDetalle({
    required this.vtaFacG,
  });

  factory AlbaranesDeVentaDetalle.fromJson(Map<String, dynamic> json) =>
      AlbaranesDeVentaDetalle(
        vtaFacG: VtaFacG.fromJson(json["vta_fac_g"]),
      );

  Map<String, dynamic> toJson() => {
        "vta_fac_g": vtaFacG.toJson(),
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
