import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

ApiImg apiImgFromJson(String str) => ApiImg.fromJson(json.decode(str));

String apiImgToJson(ApiImg data) => json.encode(data.toJson());

class ApiImg {
  int count;
  int totalCount;
  List<ArtM> artM;

  ApiImg({
    required this.count,
    required this.totalCount,
    required this.artM,
  });

  factory ApiImg.fromJson(Map<String, dynamic> json) => ApiImg(
        count: json["count"],
        totalCount: json["total_count"],
        artM: List<ArtM>.from(json["art_m"].map((x) => ArtM.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "total_count": totalCount,
        "art_m": List<dynamic>.from(artM.map((x) => x.toJson())),
      };
}

class ArtM {
  String img;

  ArtM({
    required this.img,
  });

  factory ArtM.fromJson(Map<String, dynamic> json) => ArtM(
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "img": img,
      };
}

int id = 1;

class IdImg {
  void setIdImg(int numId) {
    id = numId;
  }
}

class ImageApi {
  Future<String> patata() async {
    //https://demoapi.velneo.com/verp-api/vERP_2_dat_dat/v1/vta_ped_g/1?api_key=api123
    ApiImg? dataFromAPI;

    String url =
        "https://demoapi.velneo.com/verp-api/vERP_2_dat_dat/v1/art_m/$id?fields=img&api_key=api123";
    http.Response res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      dataFromAPI = ApiImg.fromJson(
          json.decode(res.body)); //fromJson(json.decode(res.body));
      log("Lista: $dataFromAPI");
      if (dataFromAPI != null) {
        return dataFromAPI.artM[0].img;
      } else {
        return "Nada";
      }
    } else {
      return throw ("hola");
    }
  }
}
