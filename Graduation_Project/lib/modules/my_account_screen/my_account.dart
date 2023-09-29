import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/layout/cubit/cubit.dart';
import 'package:graduation_project/layout/states/states.dart';

import '../../shared/component/components.dart';
import '../../shared/styles/colors.dart';
import '../edit_account/edit_account.dart';

class myaccountscreen extends StatelessWidget {
  const myaccountscreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String? email =AppCubit.get(context).user_model?.email;
    String? name = AppCubit.get(context).user_model?.name;
     TextEditingController? controller;
    return  BlocConsumer<AppCubit,AppStates>(
      listener: (context ,state){},
      builder: (context,state){
        return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Account Info',
              ),
              centerTitle: true,
              titleTextStyle: GoogleFonts.openSans(
                fontSize: 25,
              ),
              backgroundColor: AppColor.basecolor,
              elevation: 0,
              actions: [
                TextButton(
                    onPressed: (){
                      navigateTo(
                        context,
                        edit_account_screen(),
                      );
                    },
                    child:  Text(
                        'Edit',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: Colors.white,
                      ),
                    )
                ),
              ],
            ),
            body: Padding(
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
                    height: 7,
                  ),
                  Text(
                    '$email',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                  //****************************************************
                  SizedBox(
                    height: 22,
                  ),
                  Text(
                    'Full Name',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    '$name',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),

        );
      },

    );
  }
}
