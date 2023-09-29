abstract class TripStates {}

class TripInitialState extends TripStates{}
class GetAdminLoadingState extends TripStates{}
class GetAdminSuccessState extends TripStates{}
class GetAdminErrorState extends TripStates{
  dynamic error;
  GetAdminErrorState(error);
}

