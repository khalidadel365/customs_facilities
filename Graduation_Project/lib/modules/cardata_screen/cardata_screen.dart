import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/models/car_model.dart';
import 'package:graduation_project/models/user_model.dart';
import 'package:graduation_project/modules/fullcost_screen/fullcost_screen.dart';
import 'package:graduation_project/modules/profile_screen/profile_screen.dart';
import 'package:graduation_project/shared/component/components.dart';
import 'package:graduation_project/shared/styles/colors.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

var car_model_controller = TextEditingController();
var car_type_controller = TextEditingController();
var car_color_controller = TextEditingController();
var manufac_country_controller = TextEditingController();
var engine_controller = TextEditingController();
var yearofman_controller = TextEditingController();
var vinNumber_controller = TextEditingController();
var formkey = GlobalKey<FormState>();
//*******************************************************
var selected_car_type;
var selected_car_model;
var selected_car_color;
var selected_car_country;
var selected_car_capacity;
var selected_manufacture_year;
List<String> carTypes = ["BMW", "Mercedes"];
List<String> bmwModels = ["X6", "X7"];
List<String> mercedesModels = ["G-Class", "S-Class"];
List<String> carmodels = [];
List<String> carColors = ["Black","White"];
List<String> carCountries = ["Germany","China"];
List<String> carCapacity = ["1600-1999"];
List<String> manufacture_year = ["2021","2022","2023"];
carModel? model ;
var cost_x6=2500000;

//*********************************************************
class carData_screen extends StatefulWidget {
  @override
  State<carData_screen> createState() => _carData_screenState();
}

class _carData_screenState extends State<carData_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Car Data',
        ),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 25,
        ),
        backgroundColor: AppColor.basecolor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    labelText: "Car type",
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Color(0xFF15467B))),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Color(0xFF15467B),
                      ),
                    ),
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  value: selected_car_type,
                  items: carTypes
                      .map(
                        (value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selected_car_type = value;
                      print(selected_car_type);
                      if (selected_car_type == "BMW") {
                        carmodels = bmwModels;
                      } else {
                        carmodels = mercedesModels;
                      }
                      selected_car_model=null;
                    });
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField(
                    decoration: const InputDecoration(
                      labelText: "Car model",
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Color(0xFF15467B))),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Color(0xFF15467B),
                        ),
                      ),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    value: selected_car_model,
                    items: carmodels
                        .map(
                          (value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selected_car_model = value;
                        print(selected_car_model);
                      });
                    }),
                SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField(
                    decoration: const InputDecoration(
                      labelText: "Car Color",
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Color(0xFF15467B))),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Color(0xFF15467B),
                        ),
                      ),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    value: selected_car_color,
                    items: carColors
                        .map(
                          (value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ),
                    )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selected_car_color = value;
                        print(selected_car_color);
                      });
                    }),
                SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField(
                    decoration: const InputDecoration(
                      labelText: "Manufacturing Country",
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Color(0xFF15467B))),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Color(0xFF15467B),
                        ),
                      ),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    value: selected_car_country,
                    items: carCountries
                        .map(
                          (value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ),
                    )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selected_car_country = value;
                        print(selected_car_country);
                      });
                    }),
                SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField(
                    decoration: const InputDecoration(
                      labelText: "Engine Capacity",
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Color(0xFF15467B))),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Color(0xFF15467B),
                        ),
                      ),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    value: selected_car_capacity,
                    items: carCapacity
                        .map(
                          (value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ),
                    )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selected_car_capacity = value;
                        print(selected_car_capacity);
                      });
                    }),
                SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField(
                    decoration: const InputDecoration(
                      labelText: "Year Of Manufacture",
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Color(0xFF15467B))),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Color(0xFF15467B),
                        ),
                      ),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    value: selected_manufacture_year,
                    items: manufacture_year
                        .map(
                          (value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ),
                    )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selected_manufacture_year = value;
                        print(selected_manufacture_year);
                      });
                    }),
                SizedBox(
                  height: 15,
                ),
                defaultTextFormField(
                    controller: vinNumber_controller,
                    type: TextInputType.number,
                    label: 'VIN Number'),
                SizedBox(
                  height: 50,
                ),
                defaultMaterialButton(
                    height: 50,
                    text: 'Next',
                    color: AppColor.basecolor,
                    onPressed: () {
                      if(selected_car_type=="BMW"&&selected_car_model=="X6"){
                        FirebaseFirestore.instance.collection('X6').get().then((value) {
                          print(cost_x6);
                        }).catchError((error){
                          print(error.toString());
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => fullcost_screen(cost: cost_x6),
                            ));
                      }

                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
