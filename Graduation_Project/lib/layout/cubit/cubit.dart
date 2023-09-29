import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/layout/states/states.dart';
import 'package:graduation_project/models/car_model.dart';
import 'package:graduation_project/models/user_model.dart';
import 'package:graduation_project/shared/component/constants.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  userModel? user_model;
  carModel? car__model;
  var eemail;
  bool foundOrder = false;
  var car_order_data;
  var doc_id;
  IconData fabIcon =Icons.chat;
  bool isAdmin =false;
  getUserData(){
    emit(AppGetUserLoadingState());
    print('$uid');
    FirebaseFirestore.instance.collection('users').doc(uid).get()
    .then((value){
        print(value.data());
        if(value.data()!=null){
          user_model = userModel.fromJson(value.data());
          print(isAdmin);
          emit(AppGetUserSuccessState());
        }
        else {
          getAdminData();
        }
    });
  }
  getAdminData(){
    emit(AppGetUserLoadingState());
    print('$uid');
    FirebaseFirestore.instance.collection('admin').doc(uid).get()
        .then((value){
      print(value.data());
      user_model = userModel.fromJson(value.data());
      isAdmin = true;
      changeFloatingButton(isAdmin);
      emit(AppGetUserSuccessState());
    });
  }
  updateUser({required String email, required String name,}){
     print(email);
     print (name);
     FirebaseFirestore.instance.collection('users').doc(uid).update(
       {
         'email': email,
         'name': name,
       }
     ).then((value) {
       emit(AppUpdateUserSuccessState());
       print('user updated');
     }
     ).catchError((error){
       emit(AppUpdateUserErrorState());
       print(error);
     });
  }
  deleteUser(){
    emit(AppDeleteUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uid).delete().then((value) {
      emit(AppDeleteUserSuccessState());
    }).catchError((error){
      emit(AppDeleteUserErrorState());
    });
  }
  getCarCost({required String? car_type, required String? car_model, required String? cc,}){
    print(car_type);
    print(car_model);
    print(cc);
    emit(AppGetCarCostLoadingState());
    FirebaseFirestore.instance.collection('cars').doc(car_type).collection('$car_model').doc(cc).get().then((value){
      emit(AppGetCarCostSuccessState());
      print(value.data());
      car__model= carModel.fromJson(value.data());
    }).catchError((error){
      emit(AppGetCarCostErrorState(error));
    });
  }
  searchByVinNumber(String vin_number){
    emit(AppCheckVinNumberLoadingState());
    final carRef = FirebaseFirestore.instance.collection('car_details');
    var query = carRef.where('vin',isEqualTo: vin_number).get().then((querySnapshot){
      if(querySnapshot.size > 0) {
        foundOrder=true;
        print('$querySnapshot Success');
        for(var docSnapshot in querySnapshot.docs){
          print('${docSnapshot.id} => ${docSnapshot.data()}');
          car__model = carModel.fromJsonStatus(docSnapshot.data());
          car_order_data=docSnapshot.data();
          doc_id = docSnapshot.id;
          print(car_order_data['car_status']);
          emit(AppCheckVinNumberSuccessState());
        }
      }else{
        foundOrder= false;
        emit(AppCheckVinNumberNotFoundState());
        print('no data found');
      }
    }).catchError((error){
      print(error.toString());
    });
  }
  setCarStatus(int car_status){
    car_order_data['car_status']=car_status;
    FirebaseFirestore.instance.collection('car_details').doc(doc_id).update(
        {
          'car_status' : car_status,
        });
    }
    changeFloatingButton(isAdmin){
    emit(AppChangeFloatingButtonLoadingState());
    if(isAdmin == true){
      fabIcon = Icons.arrow_forward_ios_outlined;
      emit(AppChangeFloatingButtonSuccessState());
    }
    else{
      fabIcon = Icons.chat;
      emit(AppChangeFloatingButtonSuccessUserState());
    }
}
  }
