import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/layout/cubit/cubit.dart';
import 'package:graduation_project/layout/home_layout.dart';
import 'package:graduation_project/layout/states/states.dart';
import 'package:graduation_project/modules/login_screen/login_screen.dart';
import 'package:graduation_project/modules/my_account_screen/my_account.dart';
import 'package:graduation_project/modules/profile_screen/cubit/cubit.dart';
import 'package:graduation_project/modules/profile_screen/cubit/states.dart';
import 'package:graduation_project/modules/profile_screen/profile_screen.dart';
import 'package:graduation_project/modules/profile_screen/profile_screen.dart';
import 'package:graduation_project/modules/profile_screen/profile_screen.dart';
import 'package:graduation_project/shared/component/components.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../models/user_model.dart';
import '../../shared/component/constants.dart';
import '../../shared/styles/colors.dart';
var user = FirebaseAuth.instance.currentUser!;
  userModel? model ;
  String? email ;

class profile_screen extends StatefulWidget {
  @override
  State<profile_screen> createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {
  @override

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Profile',
            ),
            centerTitle: true,
            titleTextStyle: GoogleFonts.openSans(
              fontSize: 25,
            ),
            backgroundColor: AppColor.basecolor,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 27.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                SizedBox(
                  height: 110,
                  width: 110,
                  child: Stack(
                    fit: StackFit.expand,
                    children:  [
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/images/Person.jpg'),
                      ),
                      Positioned(
                        bottom: 0,
                        right:-13,
                        child: SizedBox(
                          height: 40,
                          width: 65,
                          child: FloatingActionButton(
                            elevation: 0,
                            backgroundColor: Colors.grey,
                            onPressed: () {},
                            child: const Icon(
                                Icons.camera_alt
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 42,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                  ),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)
                    ),
                    color: Colors.grey[200],
                    elevation: 0,
                    onPressed: (){
                      navigateTo(context, myaccountscreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        children:  [
                          Icon(
                            Icons.person_outline,
                            color: AppColor.basecolor,
                            size: 36,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Text(
                                  'My Account',
                                style: Theme.of(context).textTheme.bodyText2,
                              )
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_outlined,
                          color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15  ,
                  ),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)
                    ),
                    color: Colors.grey[200],
                    elevation: 0,
                    onPressed: (){},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        children:  [
                          Icon(
                            Icons.settings_outlined,
                            color: AppColor.basecolor,
                            size: 35,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                           Expanded(
                              child: Text(
                                'Settings',
                              style: Theme.of(context).textTheme.bodyText2,
                              )
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                          color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15  ,
                  ),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)
                    ),
                    color: Colors.grey[200],
                    elevation: 0,
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();// Navigator.pop(context);
                      navigateTo(context, login_screen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        children:  [
                          Icon(
                            Icons.logout_outlined,
                            color: AppColor.basecolor,
                            size: 35,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Text(
                                'Log Out',
                              style: Theme.of(context).textTheme.bodyText2,
                              )
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
        /*return Scaffold(
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
                  '${AppCubit.get(context).model?.name}',
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
                Card(
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  elevation: 0.0,
                  shadowColor: Colors.white,
                  child:   TextButton.icon(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();// Navigator.pop(context);
                    navigateTo(context, login_screen());
                    },
                    label: const Text(
                      "logout",
                      style: TextStyle(fontSize: 20,
                        color: Color(0xff6DADB1),
                      ),
                    ),
                    icon: const Icon(
                      Icons.logout,
                      color: Color(0xff6DADB1),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );*/
      },
    );
    /*Container(
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
                ),*/
  }
}
