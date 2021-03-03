// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:loginui/constants/cus_id.dart';
// import 'dart:async';
// import 'dart:convert';
// import 'package:loginui/secure_storage/Storage.dart';
// import 'Cart.dart';
// import 'Main2.dart';
// import 'decoding/decoding.dart';
//
// class CustomerList extends StatefulWidget {
//   @override
//   _CustomerListState createState() => _CustomerListState();
// }
//
// class _CustomerListState extends State<CustomerList> {
//   TextEditingController editingController = TextEditingController();
//   Map mapResponse;
//   SecureStorage secureStorage = SecureStorage();
//   final Decode decode = Decode();
//   List data;
//   @override
//   void initState() {
//     getData();
//   }
//
// ///////////////////////////////////////////////////API///////////////////////////////
//   Future<String> getData() async {
//     var response = await http.get(
//       ngrok + 'api/customer/' + decode.decode2(token).toString(),
//       headers: {
//         'Content-type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization':
//         'Bearer ' + await secureStorage.readSecureData('token'),
//       },
//     );
//     if (response.statusCode == 200) {
//       setState(() {
//         mapResponse = json.decode(response.body);
//         data = mapResponse["data"];
//       });
//     }
//   }
//
//   ///////////////////////////////////////////////////////////////////////////////////////
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Container(),
//         centerTitle: true,
//         title: Text('Customers'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(10.0),
//             child: TextField(
//               controller: editingController,
//               decoration: InputDecoration(
//                   hintText: "Search",
//                   prefixIcon: Icon(Icons.search),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(25.0)))),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: data == null ? 0 : data.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return InkWell(
//                   onTap: () {
//                     setState(() {
//                       cusId = data[index]['customer_id'].toString();
//                       cusName =
//                           data[index]['customer_name'].toString().toUpperCase();
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => Main2()),
//                       );
//                     });
//                   },
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.person,
//                         color: Colors.grey,
//                         size: 40.0,
//                       ),
//                       SizedBox(
//                         width: 10.0,
//                       ),
//                       Center(
//                         child: Container(
//                           height: 80.0,
//                           child: Center(
//                             child: Text(
//                               data[index]["customer_name"]
//                                   .toString()
//                                   .toUpperCase(),
//                               style: TextStyle(
//                                 color: Colors.blue,
//                                 fontSize: 20.0,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
