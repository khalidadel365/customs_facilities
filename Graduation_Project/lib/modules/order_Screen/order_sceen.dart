import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/modules/cardata_screen/cardata_screen.dart';
import 'package:graduation_project/modules/login_screen/login_screen.dart';
import 'package:graduation_project/shared/component/components.dart';
import 'package:graduation_project/modules/create_account/cubit/cubit.dart';
import 'package:graduation_project/shared/styles/colors.dart';
import 'package:image_picker/image_picker.dart';

import '../create_account/cubit/states.dart';
var name_controller = TextEditingController();
var nationalId_controller = TextEditingController();
var nationality_controller = TextEditingController();
var phoneNumber_controller = TextEditingController();
var country_controller = TextEditingController();
var email_controller = TextEditingController();
var gender_Controller= TextEditingController();
//Dropdownbutton
List<String> gender =['Male','Female'];
var selected_gender;
String? sel;
//image picker
final imagePicker =ImagePicker(); //object imagepicker
File? _image;

class order_screen extends StatefulWidget{
  @override
  State<order_screen> createState() => _order_screenState();
}

class _order_screenState extends State<order_screen> {
  Future getImage() async{
    final image =await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image=File(image!.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserRegisterCubit,UserRegisterStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Residence Data',
              ),
              centerTitle: true,
              titleTextStyle: GoogleFonts.openSans(
                fontSize: 25,
              ),
              backgroundColor: AppColor.basecolor,
              elevation: 0,
              leading: IconButton(icon: const Icon(
                Icons.arrow_back_ios_outlined,
              ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>login_screen()));

                },

              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    defaultTextFormField(
                      controller: name_controller,
                      type: TextInputType.name,
                      label: 'Name',
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                    defaultTextFormField(
                      controller: nationalId_controller,
                      type: TextInputType.number,
                      label: 'National Id',
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                    defaultTextFormField(
                      controller: nationality_controller,
                      type: TextInputType.name,
                      label: 'Nationality',
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                    defaultTextFormField(
                      controller: email_controller,
                      type: TextInputType.emailAddress,
                      label: 'Email Address',
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    defaultTextFormField(
                      controller: phoneNumber_controller,
                      type: TextInputType.number,
                      label: 'Phone Number',
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    defaultTextFormField(
                        controller: country_controller,
                        type: TextInputType.text,
                        label: 'Country Of Residence'
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: "Gender",
                        labelStyle: GoogleFonts.openSans(
                          fontSize: 15,
                          color: Colors.black
                        ),
                      ),
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      value:sel ,
                      items: gender.map(
                            (value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          sel=value;
                          print(sel);
                        });
                      },
                    ),
                    SizedBox(
                        height: 12),
                    Row(
                      children:  [
                         Text(
                          'Residency photo :',
                            style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          color: Colors.grey[300],
                          height: 30,
                          child: MaterialButton(onPressed: ()async{
                            final residencyImage =await imagePicker.pickImage(source: ImageSource.camera);
                            setState(() {
                              _image=File(residencyImage!.path);
                            });
                          },
                            child:  Text(
                              'Upload the photo',
                                style: Theme.of(context).textTheme.bodyText2
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children:  [
                         Text(
                          'Passport photo :',
                            style: Theme.of(context).textTheme.bodyText2
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          color: Colors.grey[300],
                          height: 30,
                          child: MaterialButton(onPressed: ()async{
                            final passportImage =await imagePicker.pickImage(source: ImageSource.camera);
                            setState(() {
                              _image=File(passportImage!.path);
                            });
                          },
                            child:  Text(
                              'Upload the photo',style: Theme.of(context).textTheme.bodyText2
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    defaultMaterialButton(
                        height: 50,
                        text: 'Next',
                        color: AppColor.basecolor,
                        onPressed: (){
                        UserRegisterCubit.get(context).userCreateForm(
                          nationalId: nationalId_controller.text,
                          nationality: nationality_controller.text,
                          county: country_controller.text,
                          gender: sel,
                          phone_number: phoneNumber_controller.text,
                        );
                          //____________________________________________________
                          Navigator.push(context,MaterialPageRoute(
                            builder: (context)=>carData_screen(),
                          )
                          );
                        }
                    ),

                  ],
                ),
              ),
            )
        );
      },
    );
  }
}