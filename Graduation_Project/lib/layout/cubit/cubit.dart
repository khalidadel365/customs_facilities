import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/states/states.dart';
import 'package:graduation_project/models/user_model.dart';
import 'package:graduation_project/modules/profile_screen/cubit/states.dart';
import 'package:graduation_project/shared/component/constants.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  UserModel? model;

   getUserData(){
    emit(AppGetUserLoadingState());
    print('$uid');
    FirebaseFirestore.instance.collection('users').doc(uid).get()
    .then((value){
        print(value.data());
        emit(AppGetUserSuccessState());
    })
    .catchError((error){
      AppGetUserErrorState(error);
    });
  }
}