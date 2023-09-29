import 'package:graduation_project/modules/create_account/cubit/states.dart';

abstract class UserRegisterStates {}

class InitialState extends UserRegisterStates{}

  class UserRegisterState extends UserRegisterStates{}
class UserRegisterSuccessState extends UserRegisterStates{}
class UserRegisterErrorState extends UserRegisterStates{
   dynamic error;
  UserRegisterErrorState(this.error);

}
class UserRegisterLoadingState extends UserRegisterStates{}

//*******************
class UserCreateSuccessState extends UserRegisterStates{}
class UserCreateFormSuccessState extends UserRegisterStates{}
class UserCreateFormLoadingState extends UserRegisterStates{}
class UserCreateFormErrorState extends UserRegisterStates{
  dynamic error;
  UserCreateFormErrorState(this.error);
}


