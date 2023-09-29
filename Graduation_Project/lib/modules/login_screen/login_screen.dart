import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/layout/home_layout.dart';
import 'package:graduation_project/modules/create_account/create_account.dart';
import 'package:graduation_project/modules/login_screen/cubit/cubit.dart';
import 'package:graduation_project/modules/login_screen/cubit/states.dart';
import 'package:graduation_project/shared/component/components.dart';
var loginEmailController =TextEditingController();
var loginPasswordController=TextEditingController();
bool email_validate =false;
bool pass_validate =false;
//***************************************************************************
IconData fabIcon = Icons.chat_bubble_outlined;
class login_screen extends StatefulWidget{
  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  @override
  Widget build(BuildContext context) {
   return  BlocProvider(
     create: (BuildContext context) => LoginAccountCubit() ,
     child: BlocConsumer<LoginAccountCubit,LoginAccountStates>(
       listener: (context,state){
         if(state is LoginAccountErrorState){
           Fluttertoast.showToast(
               msg: "Email or Password may not be correct",
               toastLength: Toast.LENGTH_SHORT,
               gravity: ToastGravity.BOTTOM,
               timeInSecForIosWeb: 1,
               backgroundColor: Colors.red,
               textColor: Colors.white,
               fontSize: 15.0
           );
         }
         if (state is LoginAccountSuccessState) {
           Navigator.push(
               context, MaterialPageRoute(
               builder: (context) => HomeLayout()
           )
           );
         }
       },
       builder: (context,state){
        return Scaffold(
         body: Padding(
           padding: const EdgeInsets.symmetric(
             vertical: 70.0,
             horizontal: 30,
           ),
           child: SingleChildScrollView(
             child: Center(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children:  [
                    Text(
                     'Login Your Account',
                     style: Theme.of(context).textTheme.bodyText1,
                   ),
                   SizedBox(
                     height: 35,
                   ),
                   defaultTextField(
                     obsecure_text: false,
                     validate: email_validate,
                     controller: loginEmailController,
                     label: 'Email Address',
                     prefix: Icons.email_outlined,
                     type: TextInputType.emailAddress,
                   ),
                   SizedBox(
                     height: 35,
                   ),

                   defaultTextField(
                       obsecure_text: true,
                       validate: pass_validate,
                       controller: loginPasswordController,
                       label: 'Password',
                       prefix: Icons.password_outlined,
                       type: TextInputType.visiblePassword
                   ),

                   SizedBox(
                     height: 15
                     ,
                   ),
                   TextButton(
                     onPressed: (){},
                     child: Text(
                       'Forgot Password',
                         style: Theme.of(context).textTheme.bodyText2
                     ),
                   ),
                   SizedBox(
                     height: 23,
                   ),
                   ConditionalBuilder(
                       condition: state is! LoginAccountLoadingState,
                       builder: (context)=>defaultMaterialButton(
                           text: 'Login',
                           color: const Color(0xFF15467B),
                           onPressed: (){
                             setState((){
                               loginEmailController.text.isEmpty ? email_validate = true : email_validate = false;
                               loginPasswordController.text.isEmpty ? pass_validate = true : pass_validate = false;
                               if(email_validate == false && pass_validate == false) {
                                 LoginAccountCubit.get(context).LoginAccount(
                                     email: loginEmailController.text,
                                     password: loginPasswordController.text);
                               }
                             }
                             );
                           },
                       ),
                       fallback: (context)=>const Center(
                 child:  CircularProgressIndicator(),
             )),
                   SizedBox(
                     height: 23,
                   ),
                   defaultMaterialButton(
                       text: 'Create Account',
                       color: Colors.grey,
                       onPressed:(){
                         Navigator.push(context,MaterialPageRoute(
                           builder: (context)=>create_account_screen(),
                         )
                         );
                       }
                   ),

                 ],
               ),
             ),
           ),
         ),
       );
       },

     ),
   );

  }
}