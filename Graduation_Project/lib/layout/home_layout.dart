import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/cubit/cubit.dart';
import 'package:graduation_project/layout/states/states.dart';
import 'package:graduation_project/modules/order_Screen/order_sceen.dart';
import 'package:graduation_project/modules/profile_screen/profile_screen.dart';
import 'package:graduation_project/modules/trip_screen/trip_screen.dart';
import 'package:graduation_project/shared/styles/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../models/user_model.dart';
import '../modules/profile_screen/cubit/states.dart';
import '../shared/component/constants.dart';
PersistentTabController _controller = PersistentTabController(initialIndex: 0);
class HomeLayout extends StatefulWidget {
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens() {
      return [
        order_screen(),
         trip_screen(),
        profile_screen(),
      ];
    }
    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.offline_pin_outlined),
          title: ("Order"),
          activeColorPrimary: AppColor.basecolor,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.time_to_leave_outlined),
          title: ("Trip"),
          activeColorPrimary: AppColor.basecolor,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person_outline),
          title: ("Profile"),
          activeColorPrimary: AppColor.basecolor,
          inactiveColorPrimary: Colors.grey,
        ),
      ];
    }
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body: PersistentTabView(
            context,
            controller: _controller,
            popAllScreensOnTapAnyTabs:true ,
            screens: _buildScreens(),
            items: _navBarsItems(),
            confineInSafeArea: true,
            backgroundColor: Colors.white, // Default is Colors.white.
            handleAndroidBackButtonPress: true, // Default is true.
            resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: true, // Default is true.
            hideNavigationBarWhenKeyboardShows: true, // ecommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar: Colors.white,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style4, // Choose the nav bar style with this property.
          ),
        );
      },
    );
  }


}