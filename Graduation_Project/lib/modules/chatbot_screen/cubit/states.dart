import 'package:graduation_project/modules/create_account/cubit/states.dart';

abstract class chatBotStates {}

class InitialState extends chatBotStates{}
class messageSendLoadingState extends chatBotStates{}
class messageSendSuccessState extends chatBotStates{}
class messageSendErrorState extends chatBotStates{}
class botMessageSendSuccessState extends chatBotStates{}
class botMessageSendErrorState extends chatBotStates{}


