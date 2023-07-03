/*import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  String link;
  var url;
  var response;
  var jsonResonse;
  Api(this.link) async {
     url = Uri.parse(link); // Reemplaza con la URL de tu API
    response = await http.get(url);
    jsonResonse = jsonDecode(response.body);
  }
  /*Int getCampos(){
    return
  }*/
  Future<String> fetchData(int dato1, int dato2, String dato3) async {
    //'https://demoapi.velneo.com/verp-api/vERP_2_dat_dat/v1/fam_m?page%5Bnumber%5D=1&page%5Bsize%5D=4&api_key=api123'

    if (response.statusCode == 200) {
      // La solicitud fue exitosa, puedes acceder al contenido de la respuesta
      final responseData = response.body;
      //print(" empieza $responseData termina");
      print("hola");
      return jsonResonse[dato1][dato2][dato3];
    } else {
      // La solicitud falló, puedes manejar el error de acuerdo a tus necesidades
      print('Error en la solicitud: ${response.statusCode}');
      print(response);
      return "Error";
    }
  }
}*/
import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  String link;
  var url;
  var response;
  var jsonResponse;

  Api(this.link);

  static Future<Api> createAsync(String link) async {
    var api = Api(link);
    await api._initialize();
    return api;
  }

  Future<void> _initialize() async {
    url = Uri.parse(link);
    response = await http.get(url);
    jsonResponse = jsonDecode(response.body);
    final responseData = response.body;
    print(jsonResponse);
  }

  String fetchData(String dato1, int dato2, String dato3) {
    if (response.statusCode == 200) {
      try {
        return "${jsonResponse[dato1][dato2][dato3]}";
      } catch (e) {
        return "$e";
      }
    } else {
      print('Error en la solicitud: ${response.statusCode}');
      print(response);
      return "Error";
    }
  }

  List<dynamic> listApi(dato1, dato3) {
    if (response.statusCode == 200) {
      try {
        return jsonResponse[dato1].map((sublista) => sublista[dato3]).toList();
      } catch (e) {
        return ["$e"];
      }
    } else {
      print('Error en la solicitud: ${response.statusCode}');
      print(response);
      return ["error"];
    }
  }

  Map mapApi() {
    if (response.statusCode == 200) {
      try {
        return jsonResponse[2];
      } catch (e) {
        return {"error": "$e"};
      }
    } else {
      print('Error en la solicitud: ${response.statusCode}');
      print(response);
      return {"error": "response.statusCode == 200 == false"};
    }
  }
}
//https://demoapi.velneo.com/verp-api/vERP_2_dat_dat/v1/vta_ped_g?page%5Bnumber%5D=0&page%5Bsize%5D=20&api_key=api123
//https://demoapi.velneo.com/verp-api/vERP_2_dat_dat/v1/vta_ped_g/3?api_key=api123
