// import 'dart:convert';

// import 'package:velneoapp/api/api_model.dart';
// import "package:http/http.dart" as http;

// class RemoteService {
//   Future<PedVta> getFacVta() async {
//     var uri = Uri.parse(
//         "https://demoapi.velneo.com/verp-api/vERP_2_dat_dat/v1/vta_ped_g?page%5Bsize%5D=20&fields=id,alm,clt,emp&api_key=api123");
//     var response = await http.get(uri);
//     if (response.statusCode == 200) {
//       return PedVta.fromJson((jsonDecode(response.body)));
//     } else {
//       throw Exception("Failed to load post");
//     }
//   }
// }
