import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/user_model.dart';
import 'package:graduation_project/modules/create_account/cubit/states.dart';

import '../../../shared/component/constants.dart';

class UserRegisterCubit extends Cubit<UserRegisterStates>{
  UserRegisterCubit() : super(InitialState());

  static UserRegisterCubit get(context)=>BlocProvider.of(context);

void userRegisterWithEmail({required String name, required String email, required String password,}){
  emit(UserRegisterLoadingState());
  FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,).then((value){
    print(value.user?.email);
    print(value.user?.uid);
    userCreateWithNameAndEmail(name: name, email: value.user?.email, uid: value.user?.uid);
  }).catchError((error){
   // emit(UserRegisterErrorState(error));
  });
}

  userCreateWithNameAndEmail({String? name, String? email, String? uid}){
  UserModel model = UserModel(name: name,email:email,uid: uid);
FirebaseFirestore.instance.collection('users')
    .doc(uid)
    .set(model.toMap()).then((value) {
      emit(UserCreateSuccessState());
      print(uid);
    }
).catchError((error){
  emit(UserCreateErrorState(error));
  });
}

  userCreateWithNationalityandNationalId({
    String? nationalId,
    String? gender,
    String? nationality,
    String? phone_number,
    String? county}) {
    UserModel modell = UserModel(
        national_id: nationalId ,
        gender: gender ,
        nationality: nationality ,
        phone_number: phone_number ,
        country_of_residence: county ,

    );
    FirebaseFirestore.instance.collection('users')
        .doc(uid).collection('form').add(modell.resToMap());
      emit(UserCreateSuccessState());
      print(uid);
  }



}
