import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/login_screen/cubit/cubit.dart';
import 'package:graduation_project/modules/login_screen/cubit/states.dart';

import '../../../layout/home_layout.dart';
import '../../../shared/component/constants.dart';

class LoginAccountCubit extends Cubit<LoginAccountStates>{
  LoginAccountCubit() : super(InitialState());

  static LoginAccountCubit get(context)=>BlocProvider.of(context);

    void LoginAccount ({
      required String email,
      required String password,
    }){
      emit(LoginAccountLoadingState());
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password).then(
              (value){
                uid = value.user?.uid;
                print(uid);
                emit(LoginAccountSuccessState());
              }).catchError((onError){
                emit(LoginAccountErrorState());
      });
    }
  }
