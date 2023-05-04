import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/home_layout.dart';
import 'package:graduation_project/models/user_model.dart';
import 'package:graduation_project/modules/create_account/cubit/cubit.dart';
import 'package:graduation_project/modules/create_account/cubit/states.dart';
import 'package:graduation_project/shared/component/components.dart';
import 'package:graduation_project/shared/component/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
var nameController =TextEditingController();
var emailController=TextEditingController();
var passwordController =TextEditingController();
var confpasswordController=TextEditingController();
bool name_validate =false;
bool email_validate =false;
bool pass_validate =false;
bool conpass_validate=false;

class create_account_screen extends StatefulWidget{
  @override
  State<create_account_screen> createState() => _create_account_screenState();
}
class _create_account_screenState extends State<create_account_screen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserRegisterCubit,UserRegisterStates>(
    listener: (context,state){
      if(state is UserCreateSuccessState){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeLayout()));
      }
    },
    builder: (context,state){
     return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.grey,
          ),onPressed: (){
            Navigator.pop(context);
          },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 18.0,
            horizontal: 30,
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Text(
                    'Create Account Free',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:30.0,
                    ),
                  ),
                  SizedBox(
                    height:35 ,
                  ),
                  defaultTextField(
                    label: 'Full Name',
                    controller: nameController,
                    obsecure_text: false,
                    validate: name_validate,
                    type: TextInputType.name,
                  ),
                  SizedBox(
                    height:35 ,
                  ),
                  defaultTextField(
                      label: 'Email Address',
                      controller: emailController,
                      prefix: Icons.email_outlined,
                      obsecure_text: false,
                      validate: email_validate,
                      type: TextInputType.emailAddress
                  ),
                  const SizedBox(
                    height:35 ,
                  ),
                  defaultTextField(
                    label: 'Password',
                    controller: passwordController,
                    obsecure_text: true,
                    validate: pass_validate,
                    type: TextInputType.visiblePassword,
                  ),
                  const SizedBox(
                    height:35 ,
                  ),
                  defaultTextField(
                    label: 'Confirm Password',
                    controller: confpasswordController,
                    obsecure_text: true,
                    validate: conpass_validate,
                    type: TextInputType.visiblePassword,
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  ConditionalBuilder(condition: state is !UserRegisterLoadingState,
                      builder: (context)=>defaultMaterialButton(
                          text: 'Create Account',
                          color: const Color(0xFF15467B),
                          onPressed: (){
                             setState(() {
                          nameController.text.isEmpty ? name_validate=true: name_validate =false;
                          emailController.text.isEmpty ? email_validate=true : email_validate=false;
                          passwordController.text.isEmpty ? pass_validate=true : pass_validate=false;
                          confpasswordController.text.isEmpty ? conpass_validate=true: conpass_validate =false;
                        });
                              UserRegisterCubit.get(context).userRegisterWithEmail(
                              email: emailController.text,
                              password: passwordController.text,
                              name: nameController.text,);
                          }
                      ),
                       fallback: (context)=>Center(child: CircularProgressIndicator(),)),

                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: (){},
                          child: const Text(
                            'Already have an account?',
                            style: TextStyle(
                                color: Colors.grey
                            ),
                          )),
                    ],
                  )
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
