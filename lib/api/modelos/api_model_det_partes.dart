// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

DetPartes welcomeFromJson(String str) => DetPartes.fromJson(json.decode(str));

String welcomeToJson(DetPartes data) => json.encode(data.toJson());

class DetPartes {
  int count;
  int totalCount;
  List<VtaPedG> vtaPedG;

  DetPartes({
    required this.count,
    required this.totalCount,
    required this.vtaPedG,
  });

  factory DetPartes.fromJson(Map<String, dynamic> json) => DetPartes(
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
  int id;
  int clt;
  String emp;
  String empDiv;
  DateTime fch;
  DateTime fchEnt;
  String numPed;

  VtaPedG({
    required this.id,
    required this.clt,
    required this.emp,
    required this.empDiv,
    required this.fch,
    required this.fchEnt,
    required this.numPed,
  });

  factory VtaPedG.fromJson(Map<String, dynamic> json) => VtaPedG(
        id: json["id"],
        clt: json["clt"],
        emp: json["emp"],
        empDiv: json["emp_div"],
        fch: DateTime.parse(json["fch"]),
        fchEnt: DateTime.parse(json["fch_ent"]),
        numPed: json["num_ped"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "clt": clt,
        "emp": emp,
        "emp_div": empDiv,
        "fch": fch.toIso8601String(),
        "fch_ent": fchEnt.toIso8601String(),
        "num_ped": numPed,
      };
}
