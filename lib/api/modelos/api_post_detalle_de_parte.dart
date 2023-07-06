import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:velneoapp/api/modelos/api_post_detalle_de_parte_old.dart';

/*
DetPartes? dataFromAPI;
  _getData() async {
    try {
      String url =
          "https://demoapi.velneo.com/verp-api/vERP_2_dat_dat/v1/vta_ped_g/$idDet?fields=id,clt,emp,emp_div,fch,fch_ent,num_ped&api_key=api123";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFromAPI = DetPartes.fromJson(json.decode(res.body));
*/
class Post {
  const Post();
  void postData({
    required int idDet,
    String? emp,
    String? empdiv,
    DateTime? fch,
    DateTime? fchent,
    String? numped,
    int? clt,
  }) async {
    //https://demoapi.velneo.com/verp-api/vERP_2_dat_dat/v1/vta_ped_g/1?api_key=api123
    PostDetPart? dataFromAPI;
    try {
      String url =
          "https://demoapi.velneo.com/verp-api/vERP_2_dat_dat/v1/vta_ped_g/$idDet?api_key=api123";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFromAPI = PostDetPart.fromJson(json.decode(res.body));
        dataFromAPI.vtaPedG[0].id = idDet;
        dataFromAPI.vtaPedG[0].clt = clt ?? dataFromAPI.vtaPedG[0].clt;
        dataFromAPI.vtaPedG[0].emp = emp ?? dataFromAPI.vtaPedG[0].emp;
        dataFromAPI.vtaPedG[0].empDiv = empdiv ?? dataFromAPI.vtaPedG[0].empDiv;
        dataFromAPI.vtaPedG[0].fch = fch ?? dataFromAPI.vtaPedG[0].fch;
        dataFromAPI.vtaPedG[0].fchEnt = fchent ?? dataFromAPI.vtaPedG[0].fchEnt;
        dataFromAPI.vtaPedG[0].numPed = numped ?? dataFromAPI.vtaPedG[0].numPed;
        String modifiedApiData = json.encode(dataFromAPI);
        log("Lista: $modifiedApiData");

        /*var responsedel = await http.delete(Uri.parse(
            "https://demoapi.velneo.com/verp-api/vERP_2_dat_dat/v1/vta_ped_g/$idDet?api_key=api123"));
        if (responsedel.statusCode == 200) {
          print('Dato eliminado');*/

        var response = await http.post(
          Uri.parse(
              "https://demoapi.velneo.com/verp-api/vERP_2_dat_dat/v1/vta_ped_g/$idDet?api_key=api123"), // En un futuro si este link no funciona provar con https://demoapi.velneo.com/verp-api/vERP_2_dat_dat/v1/vta_ped_g?api_key=api123
          headers: {
            'Content-type': 'application/json'
          }, // Establece el tipo de contenido de la solicitud
          body: modifiedApiData, // Cuerpo de la solicitud en formato JSON
        );
        if (response.statusCode == 200) {
          // La solicitud fue exitosa
          log('Respuesta: ${response.body}');
          log('Error: ${response.statusCode}');
        } else {
          // Ocurrió un error en la solicitud
          log('Error: ${response.statusCode}');
        }
      } else {
        log('Error al eliminar el dato');
      }

      // "https://demoapi.velneo.com/verp-api/vERP_2_dat_dat/v1/vta_ped_g?api_key=api123"),
      //setState(() {});
      /*} else {}*/
    } catch (e) {
      log("NONO fallo el  ${e.toString()}");
    }
  }
}
