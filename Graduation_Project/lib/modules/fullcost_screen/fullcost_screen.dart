import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/layout/cubit/cubit.dart';
import 'package:graduation_project/shared/component/components.dart';
import 'package:graduation_project/shared/styles/colors.dart';

import '../payment_screen/bank_acc_screen.dart';

class fullcost_screen extends StatelessWidget{
  fullcost_screen();

  @override
  Widget build(BuildContext context) {
    //String? cc =AppCubit.get(context).car__model?.cc;
    String? customs_tax = AppCubit.get(context).car__model?.customs_tax;
    String? development_fees=AppCubit.get(context).car__model?.development_fees;
    String? price=AppCubit.get(context).car__model?.price;
    String? schedule_tax=AppCubit.get(context).car__model?.schedule_tax;
    String? total_value=AppCubit.get(context).car__model?.total_value;
    String? value_added_tax=AppCubit.get(context).car__model?.value_added_tax;
   return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Full Cost',
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
            Navigator.pop(context);
          },
        ),
      ),
     body: Padding(
   padding: const EdgeInsets.all(22.0),
    child: SingleChildScrollView(
      child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(
             'The price of the car : $price',
           style: GoogleFonts.openSans(
               fontSize: 17,
               color: Colors.black,
               fontWeight: FontWeight.w600
           ),
           ),
           SizedBox(
             height: 12,
           ),
           Padding(
             padding: EdgeInsets.only(
                right: 15,
             ),
             child: Container(
               width: double.infinity,
               height: 1,
               color: AppColor.basecolor,
             ),
           ),
           SizedBox(
             height: 12,
           ),
           Text(
               'Customs tax : $customs_tax',
             style: GoogleFonts.openSans(
                 fontSize: 17,
                 color: Colors.black,
                 fontWeight: FontWeight.w600
             ),
           ),
           SizedBox(
             height: 12,
           ),
           Padding(
             padding: EdgeInsets.only(
               right: 15,
             ),
             child: Container(
               width: double.infinity,
               height: 1,
               color: AppColor.basecolor,
             ),
           ),
           SizedBox(
             height: 12,
           ),
           Text(
               'Development fees : $development_fees',
             style: GoogleFonts.openSans(
                 fontSize: 17,
                 color: Colors.black,
                 fontWeight: FontWeight.w600
             ),
           ),
           SizedBox(
             height: 12,
           ),
           Padding(
             padding: EdgeInsets.only(
               right: 15,
             ),
             child: Container(
               width: double.infinity,
               height: 1,
               color: AppColor.basecolor,
             ),
           ),
           SizedBox(
             height: 12,
           ),
           Text(
               'Schedule tax : $schedule_tax',
             style: GoogleFonts.openSans(
                 fontSize: 17,
                 color: Colors.black,
                 fontWeight: FontWeight.w600
             ),
           ),
           SizedBox(
             height: 12,
           ),
           Padding(
             padding: EdgeInsets.only(
               right: 15,
             ),
             child: Container(
               width: double.infinity,
               height: 1,
               color: AppColor.basecolor,
             ),
           ),
           SizedBox(
             height: 12,
           ),
           Text(
             'Value added tax : $value_added_tax',
             style: GoogleFonts.openSans(
                 fontSize: 17,
                 color: Colors.black,
                 fontWeight: FontWeight.w600
             ),),
           SizedBox(
             height: 12,
           ),
           Padding(
             padding: EdgeInsets.only(
               right: 15,
             ),
             child: Container(
               width: double.infinity,
               height: 1,
               color: AppColor.basecolor,
             ),
           ),
           SizedBox(
             height: 12,
           ),
            Text(
                'The total customs value is : $total_value',
              style: GoogleFonts.openSans(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w600
              ),
            ),
           SizedBox(
             height: 12,
           ),
           Padding(
             padding: EdgeInsets.only(
               right: 15,
             ),
             child: Container(
               width: double.infinity,
               height: 1,
               color: AppColor.basecolor,
             ),
           ),
           SizedBox(
             height: 253,
           ),
           defaultMaterialButton(
               height: 50,
               text: 'Next',
               color: AppColor.basecolor,
               onPressed: (){
                 Navigator.push(context,MaterialPageRoute(
                   builder: (context)=>payment_screen(),
                 )
                 );
               }
           ),
         ],
       ),
    ),
     ),
    );
  }


}