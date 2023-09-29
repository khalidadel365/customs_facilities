import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/layout/cubit/cubit.dart';
import 'package:graduation_project/layout/states/states.dart';
import 'package:graduation_project/models/car_model.dart';
import 'package:graduation_project/models/user_model.dart';
import 'package:graduation_project/modules/fullcost_screen/fullcost_screen.dart';
import 'package:graduation_project/modules/profile_screen/profile_screen.dart';
import 'package:graduation_project/shared/component/components.dart';
import 'package:graduation_project/shared/styles/colors.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

var car_color_controller = TextEditingController();
var manufac_country_controller = TextEditingController();
var vinNumber_controller = TextEditingController();
var formkey = GlobalKey<FormState>();
//*******************************************************
List<String> carTypes = ["BMW", "MERCEDES"];
List<String> bmwModels = ["X2", "X3","X4","X5","X6"];
List<String> mercedesModels = ["A-180", "C-180","E-200"];
List<String> carCapacity = ["1600-1800cc","1800-2000cc"];
List<String> manufacture_year = ["2021","2022","2023"];
//*****************************************************************
List<String> carmodels = [];
List<String> carColors = ["Black","White"]; // not list
List<String> carCountries = ["Germany","China"];//not list
//************************************************************************************************
carModel? model ;
String? car_type;
String? car_model; // bm
String? cc;
var year_of_manufacture;
// String? car_color;
// String? manufacture_county;
//String? vin_number;
carModel? car_modell;
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
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Car Data',
            ),
            centerTitle: true,
            titleTextStyle: GoogleFonts.openSans(
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
                      value: car_type,
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
                          car_type = value;
                          print(car_type);
                          if (car_type == "BMW") {
                            carmodels = bmwModels;
                          } else {
                            carmodels = mercedesModels;
                          }
                          // selected_car_model=null;
                          car_model=null;
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
                        value: car_model,
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
                            car_model = value;
                            print(car_model);
                          });
                        }
                    ),
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
                        value: year_of_manufacture,
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
                            year_of_manufacture = value;
                            print(year_of_manufacture);
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
                        value: cc,
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
                            cc = value;
                            print(cc);
                          });
                        }),
                    SizedBox(
                      height: 15,
                    ),
                    defaultTextFormField(
                        controller: car_color_controller,
                        type: TextInputType.text,
                        label: 'Car Color'),
                    SizedBox(
                      height: 15,
                    ),
                    defaultTextFormField(
                        controller: manufac_country_controller,
                        type: TextInputType.text,
                        label: 'Manufacturing Country'),
                    SizedBox(
                      height: 15,
                    ),
                    defaultTextFormField(
                        controller: vinNumber_controller,
                        type: TextInputType.number,
                        label: 'VIN Number'),
                    //*********************************************************************
                    SizedBox(
                      height: 50,
                    ),
                    defaultMaterialButton(
                        height: 50,
                        text: 'Next',
                        color: AppColor.basecolor,
                        onPressed: () {
                          AppCubit.get(context).getCarCost(car_type: car_type, car_model: car_model, cc: cc);
                          //***********************************************************************************
                              car_modell = carModel(
                              car_status: 0,
                              car_type: car_type,
                              car_model: car_model,
                              year_of_manu: year_of_manufacture,
                              engine_capacity: cc,
                              car_color: car_color_controller.text,
                              manu_country: manufac_country_controller.text,
                              vin_number: vinNumber_controller.text,
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => fullcost_screen(),
                              ));
                        }
                        ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
