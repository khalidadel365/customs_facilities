import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/layout/cubit/cubit.dart';
import 'package:graduation_project/layout/states/states.dart';
import 'package:graduation_project/modules/profile_screen/profile_screen.dart';
import 'package:graduation_project/shared/component/components.dart';

import '../../shared/styles/colors.dart';
var name_controller =TextEditingController();
var email_controller =TextEditingController();
class edit_account_screen extends StatelessWidget {
  const edit_account_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){
        if(state is AppUpdateUserSuccessState){
          Fluttertoast.showToast(
              msg: "User Updated Successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 15.0
          );
        }
      },
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Edit Account',
            ),
            centerTitle: true,
            titleTextStyle: GoogleFonts.openSans(
              fontSize: 25,
            ),
            backgroundColor: AppColor.basecolor,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(17.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  TextFormField(
                    controller: email_controller,
                    decoration: InputDecoration(
                        hintText: ''
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  //****************************************************
                  Text(
                    'Full Name',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  TextFormField(
                    controller: name_controller ,
                    decoration: InputDecoration(
                      hintText: AppCubit.get(context).user_model?.name,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  defaultMaterialButton(
                      text: 'Update',
                      color: AppColor.basecolor,
                      onPressed: (){
                        AppCubit.get(context).updateUser(
                          email: email_controller.text,
                          name: name_controller.text,
                        );
                      }
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  defaultMaterialButton(
                      text: 'Delete Account',
                      color: Colors.red,
                      onPressed: (){
                        AppCubit.get(context).deleteUser();
                      }
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
