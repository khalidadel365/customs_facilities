import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/home_layout.dart';
import 'package:graduation_project/modules/order_Screen/order_sceen.dart';
import 'package:graduation_project/modules/profile_screen/cubit/states.dart';
import 'package:graduation_project/modules/profile_screen/profile_screen.dart';
import 'package:graduation_project/modules/trip_screen/trip_screen.dart';
import 'package:graduation_project/shared/component/constants.dart';


import '../../../models/user_model.dart';

class ProfileCubit extends Cubit<ProfileStates>{
  ProfileCubit() :super (ProfileInitialState());
  UserModel? model;
  static ProfileCubit get(context)=>BlocProvider.of(context);

  void getUserData (){
    emit(GetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uid).get()
        .then((value) {
      print(value.data());
      print(value);
      print('************');
     // model = model?.fromJson(value.data());
      emit(GetUserSuccessState());
    }).catchError((onError){
      emit(GetUserErrorState(onError.toString()));
    });
  }
}