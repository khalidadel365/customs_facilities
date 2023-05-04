import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/login_screen/login_screen.dart';
import 'package:graduation_project/modules/profile_screen/cubit/cubit.dart';
import 'package:graduation_project/modules/profile_screen/cubit/states.dart';
import 'package:graduation_project/modules/profile_screen/profile_screen.dart';
import 'package:graduation_project/modules/profile_screen/profile_screen.dart';
import 'package:graduation_project/modules/profile_screen/profile_screen.dart';
import '../../models/user_model.dart';
import '../../shared/component/constants.dart';
import '../../shared/styles/colors.dart';
var user = FirebaseAuth.instance.currentUser!;
  UserModel? model ;
  String? email ;
  String? name;
class profile_screen extends StatefulWidget {
  @override
  State<profile_screen> createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {
  @override
  /*void initState() {
    // TODO: implement initState
    getUserData();
    super.initState();
  }*/
  // /*CollectionReference  data_user =FirebaseFirestore
  // .instance.collection('user').doc(uid) as CollectionReference<Object?>;*/
  /*void getUserData () async{
    //emit(GetUserLoadingState());
    await FirebaseFirestore.
    instance.
    collection('users').
    doc(uid!).
    get().then((value) {
      print(value);
      print('*************');
      print(value.data());
    });
  }*/
   getAdminData () async{
    //emit(GetUserLoadingState());
    // await FirebaseFirestore.instance.collection('admin').doc(uid).get()
    //     .then((value) {
    //   print(value.data());
    //   print('sssssssssssssssssssssssssssssssssssssssssssssssss');
    //   print(value.data()!['email']);
    //   setState(() {
    //     email=value.data()!['email']; //*******************
    //     name=value.data()!['name'];
    //     print('$email');
    //     print(email!);
    //     print('$name');
    //   });
    //   //  model!.fromJson(value.data());
    //   // emit(GetUserSuccessState());
    // }).catchError((onError){
    //   // emit(GetUserErrorState(onError.toString()));
    //   print('error');
    // });
    /* getData() async {
       var responsebody= await data_user.get();
       responsebody.docs.forEach((value) {
         setState(() {
           data_user.add(value.data());

         });
       });
     }*/
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ProfileCubit(),
      child: BlocConsumer<ProfileCubit,ProfileStates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Profile',
            ),
            centerTitle: true,
            titleTextStyle: const TextStyle(
              fontSize: 25,
            ),
            backgroundColor: AppColor.basecolor,
            elevation: 0,
          ),
          body:Padding(
            padding: EdgeInsets.all(40),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  Stack(
                    children: const [
                      CircleAvatar(
                        radius: 55,
                        backgroundImage:AssetImage('assets/images/Person.jpg'),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 10),
                   Text(
                     '${user.email}', style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                    ),maxLines: 1,),
                  const SizedBox(
               height: 4,
                  ),
                  Text(
                    '$userName',
                    style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ), maxLines: 1,
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  Container(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton.icon(onPressed: (){},
                      icon: Icon(Icons.privacy_tip),
                      label: Text('Privacy'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        primary: AppColor.basecolor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton.icon(onPressed: (){},
                      icon: Icon(Icons.settings),
                      label: Text('Settings'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        primary: AppColor.basecolor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton.icon(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>login_screen())
                      );
                    },
                      icon: Icon(Icons.logout),
                      label: Text('Logout'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        primary: AppColor.basecolor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
        },
      ),
    );
  }
}
