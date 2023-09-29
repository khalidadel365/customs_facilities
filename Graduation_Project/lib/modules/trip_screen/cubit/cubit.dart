import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/user_model.dart';
import '../../../shared/component/constants.dart';
import 'states.dart';

class TripCubit extends Cubit<TripStates>{
  TripCubit():super(TripInitialState());

  static TripCubit get(context) => BlocProvider.of(context);

  userModel? model;
  var eemail;

}