import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class carModel {
  late String cost;
carModel({required  this.cost});

   fromJson(QuerySnapshot<Map<String, dynamic>>? json ){
   json?.docs.forEach((element) {
    var cost=element["cost"];
    print(cost);
   });
 }

   /*carModel.name(QuerySnapshot<Map<String, dynamic>> map){
         map.docs.forEach((value) {
          var cost=value["cost"];
          print(cost);
          return cost;
        });

  }*/
 }

