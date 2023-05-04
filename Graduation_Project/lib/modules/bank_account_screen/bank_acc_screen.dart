import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/shared/component/components.dart';
import 'package:graduation_project/shared/styles/colors.dart';

class bank_account_screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text(
         'Bank Account',
       ),
       centerTitle: true,
       titleTextStyle: const TextStyle(
         fontSize: 25,
       ),
       backgroundColor: AppColor.basecolor,
       elevation: 0,
       leading: IconButton(icon: const Icon(
         Icons.arrow_back_ios_outlined,
       ),
         onPressed: (){
           Navigator.pop(context);
         },

       ),
     ),
     body: Padding(
    padding: const EdgeInsets.all(22.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.end,
       children: [
         defaultMaterialButton(
             height: 50,
             text: 'Submit',
             color: AppColor.basecolor,
             onPressed: (){
               Navigator.push(context,MaterialPageRoute(
                 builder: (context)=>bank_account_screen(),
               )
               );
             }
         ),
       ],
     ),
     ),
   );
  }


}