import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/shared/component/components.dart';
import 'package:graduation_project/shared/styles/colors.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';
TextEditingController cardNumberController = TextEditingController();
TextEditingController fullNameController = TextEditingController();
TextEditingController cvvController = TextEditingController();
TextEditingController expireDateController = TextEditingController();


//CardType cardType =CardType.Invalidl;
String getCleanedNumber (String text){
RegExp regExp = RegExp(r"[^0-9]");
return text.replaceAll(regExp, '');
}
void getCardTypeFrmNum(){
  String CardNum = getCleanedNumber(cardNumberController.text);
}
class payment_screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return BlocProvider(
     create: (BuildContext context) => bank_account_cubit() ,
     child: BlocConsumer<bank_account_cubit,bank_account_states>(
       listener:(context,state){} ,
       builder: (context,state){
         return
           Scaffold(
             appBar: AppBar(
               title: const Text(
                 'Bank Account',
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
               child: Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(
                         horizontal: 5
                     ),
                     child: TextFormField(
                       controller: cardNumberController,
                       inputFormatters: [
                         FilteringTextInputFormatter.digitsOnly,
                         LengthLimitingTextInputFormatter(18),
                         CardNumberInputFormatter(),
                       ],
                       keyboardType: TextInputType.number,
                       decoration: InputDecoration(
                           prefixIcon: Icon(
                             Icons.credit_card_outlined,
                             color: AppColor.basecolor,
                           ),
                           labelText: "Card Number",
                           labelStyle:  GoogleFonts.openSans(
                             fontSize: 15,
                             color: Colors.black,
                           ),
                           filled: true,
                           fillColor: Colors.white70,
                           enabledBorder:const OutlineInputBorder(
                               borderRadius: BorderRadius.all(Radius.circular(20)
                               ),
                               borderSide: BorderSide(
                                   color: Color(0xFF15467B))
                           ),
                           focusedBorder: const OutlineInputBorder(
                             borderRadius: BorderRadius.all(
                                 Radius.circular(10)
                             ),
                             borderSide: BorderSide(
                               color: Color(0xFF15467B),
                             ),
                           ),
                           border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(20.0),
                           ),
                           hintText: "Card Number",
                           hintStyle: GoogleFonts.openSans(
                             fontSize: 15,
                           )
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(
                         horizontal: 5
                     ),
                     child: TextFormField(
                       controller: fullNameController,
                       decoration: InputDecoration(
                           prefixIcon: Icon(
                             Icons.credit_card_outlined,
                             color: AppColor.basecolor,
                           ),
                           labelText: "Full Name",
                           labelStyle:  GoogleFonts.openSans(
                             fontSize: 15,
                             color: Colors.black,
                           ),
                           filled: true,
                           fillColor: Colors.white70,
                           enabledBorder:const OutlineInputBorder(
                               borderRadius: BorderRadius.all(Radius.circular(20)
                               ),
                               borderSide: BorderSide(
                                   color: Color(0xFF15467B))
                           ),
                           focusedBorder: const OutlineInputBorder(
                             borderRadius: BorderRadius.all(
                                 Radius.circular(10)
                             ),
                             borderSide: BorderSide(
                               color: Color(0xFF15467B),
                             ),
                           ),
                           border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(20.0),
                           ),
                           hintText: "Full Name",
                           hintStyle: GoogleFonts.openSans(
                             fontSize: 15,
                           )
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   Row(
                     children: [
                       Expanded(
                         child: TextFormField(
                           controller: cvvController,
                           inputFormatters: [
                             FilteringTextInputFormatter.digitsOnly,
                             LengthLimitingTextInputFormatter(3),
                             CardNumberInputFormatter(),
                           ],
                           keyboardType: TextInputType.number,
                           decoration: InputDecoration(
                               filled: true,
                               fillColor: Colors.white70,
                               enabledBorder:const OutlineInputBorder(
                                   borderRadius: BorderRadius.all(Radius.circular(20)
                                   ),
                                   borderSide: BorderSide(
                                       color: Color(0xFF15467B))
                               ),
                               focusedBorder: const OutlineInputBorder(
                                 borderRadius: BorderRadius.all(
                                     Radius.circular(10)
                                 ),
                                 borderSide: BorderSide(
                                   color: Color(0xFF15467B),
                                 ),
                               ),
                               border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(20.0),
                               ),
                               hintText: "CVV",
                               hintStyle: GoogleFonts.openSans(
                                   fontSize: 15,
                                   color: Colors.black
                               )
                           ),
                         ),
                       ),
                       SizedBox(
                         width: 20,
                       ),
                       Expanded(
                         child: TextFormField(
                           controller: expireDateController,
                           inputFormatters: [
                             FilteringTextInputFormatter.digitsOnly,
                             LengthLimitingTextInputFormatter(4),
                             CardMounthInputFormatter(),
                           ],
                           keyboardType: TextInputType.number,
                           decoration: InputDecoration(
                               filled: true,
                               fillColor: Colors.white70,
                               enabledBorder:const OutlineInputBorder(
                                   borderRadius: BorderRadius.all(Radius.circular(20)
                                   ),
                                   borderSide: BorderSide(
                                       color: Color(0xFF15467B))
                               ),
                               focusedBorder: const OutlineInputBorder(
                                 borderRadius: BorderRadius.all(
                                     Radius.circular(10)
                                 ),
                                 borderSide: BorderSide(
                                   color: Color(0xFF15467B),
                                 ),
                               ),
                               border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(20.0),
                               ),
                               hintText: "MM/YY",
                               hintStyle: GoogleFonts.openSans(
                                   fontSize: 15,
                                   color: Colors.black
                               )
                           ),
                         ),
                       ),
                     ],
                   ),
                   SizedBox(
                     height: 50,
                   ),
                   defaultMaterialButton(
                       height: 50,
                       text: 'Submit',
                       color: AppColor.basecolor,
                       onPressed: (){
                         print(cardNumberController.text.replaceAll("  ", ''));
                         //**************************store bank account in firebase ******************************************
                         bank_account_cubit.get(context).set_bank_account_info(
                           card_num: cardNumberController.text.replaceAll("  ", ''),
                           full_name: fullNameController.text,
                           cvv: cvvController.text,
                           exp_date: expireDateController.text,
                         );
                         //****************************** submit the order ****************************************
                         bank_account_cubit.get(context).set_order_car();
                       }
                   ),
                 ],
               ),
             ),
           );
       },
     ),
   );
  }
}
class CardNumberInputFormatter extends TextInputFormatter{
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if(newValue.selection.baseOffset==0){
      return newValue;
    }
    String inputData = newValue.text;
    StringBuffer buffer = StringBuffer();
    for(var i=0 ; i <inputData.length;i++){
      buffer.write(inputData[i]);
      int index =i+1;
      if(index % 4 == 0 && inputData.length != index ){
        buffer.write("  ");
      }
    }
    return TextEditingValue(
        text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.toString().length,),
    );
  }
}
class CardMounthInputFormatter extends TextInputFormatter{
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if(newValue.selection.baseOffset==0){
      return newValue;
    }
    var buffer= StringBuffer();
    for(var i=0 ; i <newText.length;i++){
      buffer.write(newText[i]);
      var nonZeroIndex =i+1;
      if(nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length ){
        buffer.write("/");
      }
    }
    var string =buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}