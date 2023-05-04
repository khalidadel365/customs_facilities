import 'package:flutter/material.dart';
import 'package:graduation_project/shared/styles/colors.dart';

Widget defaultTextField ({
   required String? label ,
   required TextEditingController controller,
   required bool validate,
   required bool obsecure_text,
   IconData? prefix,
   TextInputType? type,
}) => TextField(
  keyboardType: type,
   obscureText:obsecure_text ,
   controller: controller,
   decoration: InputDecoration(
       labelText: label,
       filled: true,
       fillColor: Colors.white70,
       errorText: validate ? 'Value Can\'t Be Empty' : null,
       border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    prefixIcon: Icon(
      prefix
    )
  ),
);
//********************************************************************
Widget defaultMaterialButton({
  required String text,
  required Color color,
  VoidCallback? onPressed,
  double height =55,
  double width = double.infinity,
  bool isUpperCase = true,
  bool isClickable = true,
}) => Container(
    width: double.infinity,
    height: height,
    decoration: BoxDecoration(
      color:color,
      borderRadius: BorderRadius.circular(20),
    ),
    child: MaterialButton(
      onPressed: onPressed,
      child: Text(
        '$text',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
    )
);
//******************************************************************

Widget defaultTextFormField ({
  required TextEditingController controller,
  required TextInputType type,
  required String? label,
  IconData? prefix,
  ValueChanged? onSubmit,
  ValueChanged? onChanged,
  FormFieldValidator? validate,
  bool obsecureText = false,
} ) =>TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: obsecureText,
  onFieldSubmitted: onSubmit,
  onChanged: onChanged,
  validator: validate,
  decoration: InputDecoration(
    labelStyle: const TextStyle(
      color: Colors.black,
    ),
    labelText: label,
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
    ),
);