abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates{}
class GetUserLoadingState extends ProfileStates{}
class GetUserSuccessState extends ProfileStates{}
class GetUserErrorState extends ProfileStates{
  final String error;
  GetUserErrorState(this.error);
}
