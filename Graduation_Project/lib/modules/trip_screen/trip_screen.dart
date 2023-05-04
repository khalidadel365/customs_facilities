import 'package:flutter/material.dart';
import 'package:graduation_project/shared/styles/colors.dart';

class trip_screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trip',
        ),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 25,
        ),
        backgroundColor: AppColor.basecolor,
        elevation: 0,
      ),
      /* body: Content(),*/
    );
  }
}