abstract class AppStates {}

class AppInitialState extends AppStates {}
class AppGetUserLoadingState extends AppStates {}
class AppGetUserSuccessState extends AppStates{}
class AppUpdateUserSuccessState extends AppStates{}
class AppUpddateUserLoadingState extends AppStates{}
class AppUpdateUserErrorState extends AppStates{}
class AppDeleteUserSuccessState extends AppStates{}
class AppDeleteUserLoadingState extends AppStates{}
class AppDeleteUserErrorState extends AppStates{}
class AppGetCarCostSuccessState extends AppStates {}
class AppGetCarCostLoadingState extends AppStates {}
class AppGetCarCostErrorState extends AppStates {
  var error;
  AppGetCarCostErrorState(this.error);
}
class AppCheckVinNumberLoadingState extends AppStates {}
class AppCheckVinNumberSuccessState extends AppStates {}
class AppCheckVinNumberNotFoundState extends AppStates {}
class AppChangeFloatingButtonSuccessState extends AppStates {}
class AppChangeFloatingButtonErrorState extends AppStates {}
class AppChangeFloatingButtonLoadingState extends AppStates {}
class AppChangeFloatingButtonSuccessUserState extends AppStates {}

