// To parse this JSON data, do
//
//     final facturasDeVenta = facturasDeVentaFromJson(jsonString);

import 'dart:convert';

List<FacturasDeVenta> facturasDeVentaFromJson(String str) =>
    List<FacturasDeVenta>.from(json.decode(str));

String facturasDeVentaToJson(FacturasDeVenta data) =>
    json.encode(data.toJson());

class FacturasDeVenta {
  List<PedVta> pedVta;

  FacturasDeVenta({
    required this.pedVta,
  });

  factory FacturasDeVenta.fromJson(Map<String, dynamic> json) =>
      FacturasDeVenta(
        pedVta:
            List<PedVta>.from(json["Ped_Vta"].map((x) => PedVta.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Ped_Vta": List<dynamic>.from(pedVta.map((x) => x.toJson())),
      };
}

class PedVta {
  int id;
  int clt;
  String emp;

  PedVta({
    required this.id,
    required this.clt,
    required this.emp,
  });

  factory PedVta.fromJson(Map<String, dynamic> json) => PedVta(
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
