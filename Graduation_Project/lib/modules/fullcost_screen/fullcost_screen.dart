import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/modules/bank_account_screen/bank_acc_screen.dart';
import 'package:graduation_project/shared/component/components.dart';
import 'package:graduation_project/shared/styles/colors.dart';

class fullcost_screen extends StatelessWidget{
  var cost;

  fullcost_screen({required this.cost});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Full Cost',
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
   padding: const EdgeInsets.all(27.0),
    child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text('The price of the car : 2,500,000',
         style: TextStyle(
           fontSize: 22,
           fontWeight: FontWeight.bold
         ),),
         SizedBox(
           height: 15,
         ),
         const Text(
             'cc:1600-1999',
             style: TextStyle(
             fontSize: 22,
             fontWeight: FontWeight.bold
         )),
         SizedBox(
           height: 15,
         ),
         Text('customs tax (40%): 3,375,000',
             style: TextStyle(
                 fontSize: 22,
                 fontWeight: FontWeight.bold
             )
         ),
         SizedBox(
           height: 15,
         ),
         Text('development fees(5%):293,750',
             style: TextStyle(
                 fontSize: 22,
                 fontWeight: FontWeight.bold
             )),
         SizedBox(
           height: 15,
         ),
         Text('schedule tax(15%):925,312.5',
             style: TextStyle(
                 fontSize: 22,
                 fontWeight: FontWeight.bold
             )),
         SizedBox(
           height: 15,
         ),
         Text('Value added tax(14%):993,168.75',
             style: TextStyle(
                 fontSize: 22,
                 fontWeight: FontWeight.bold
             )),
         SizedBox(
           height: 15,
         ),
         const Text('he total customs value is :5,587,231.25',
             style: TextStyle(
                 fontSize: 22,
                 fontWeight: FontWeight.bold
             )),
         SizedBox(
           height: 320),
         defaultMaterialButton(
             height: 50,
             text: 'Next',
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