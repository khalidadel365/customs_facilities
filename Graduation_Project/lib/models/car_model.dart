import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduation_project/modules/cardata_screen/cardata_screen.dart';

import '../shared/component/constants.dart';

class carModel {
  String? cc;
  String? customs_tax;
  String? development_fees;
  String? price;
  String? schedule_tax;
  String? total_value;
  String? value_added_tax;
  //*******************************************************************
  int? car_status;
  String? car_type;
  String? car_model;
  var year_of_manu;
  String? engine_capacity;
  String? car_color;
  String? manu_country;
  String? vin_number;
  late int get_car_status;
  late int set_car_status;
  carModel({
     this.car_status,
     this.car_type,
     this.car_model,
     this.year_of_manu,
     this.engine_capacity,
     this.car_color,
     this.manu_country,
     this.vin_number,
  });
  carModel.fromJson(Map<String,dynamic>? json){
    print(json);
    cc=json!['cc'];
    customs_tax=json['customs_tax'];
    development_fees=json['development_fees'];
    price=json['price'];
    schedule_tax=json['schedule_tax'];
    total_value=json['total_value'];
    value_added_tax=json['value_added_tax'];
  }
  Map<String,dynamic> orderToMap(){
    return{
      'car_status':car_status,
      'color':car_color,
      'country':manu_country,
      'engine':engine_capacity,
      'model':car_model,
      'type':car_type,
      'user_id':uid,
      'vin':vin_number,
      'year_of_manufacturing':year_of_manu,
    };
  }
  carModel.fromJsonStatus(Map<String,dynamic>? json){
    get_car_status=json!['car_status'];
    print(get_car_status);
  }
 }

