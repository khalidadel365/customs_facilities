import 'package:graduation_project/modules/create_account/cubit/states.dart';

abstract class LoginAccountStates {}

class InitialState extends LoginAccountStates{}

class LoginAccountState extends LoginAccountStates {}
class LoginAccountSuccessState extends LoginAccountStates{}
class LoginAccountErrorState extends LoginAccountStates{}
class LoginAccountLoadingState extends LoginAccountStates{}


