import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/bank_account_model.dart';
import 'package:graduation_project/models/car_model.dart';
import 'package:graduation_project/modules/cardata_screen/cardata_screen.dart';
import 'package:graduation_project/modules/payment_screen/cubit/states.dart';
import '../../../shared/component/constants.dart';

class bank_account_cubit extends Cubit<bank_account_states> {
  bank_account_cubit() :super(AppInitialState());

  static bank_account_cubit get(context) => BlocProvider.of(context);

  set_bank_account_info({ // with nationality and nationalId
    String? card_num,
    String? full_name,
    String? cvv,
    String? exp_date,
  }) {
    bank_account_model bank_model = bank_account_model(
        card_num: card_num,
        full_name: full_name,
        cvv: cvv,
        exp_date: exp_date,
        id: uid,
    );
    emit(AppSetBankAccountLoadingState());
    FirebaseFirestore.instance.collection('payment')
        .doc(uid)
    .set(bank_model.resToMap()).then((value){
      print(bank_model.resToMap());
      emit(AppSetBankAccountSuccessState());
    }).catchError((){
      AppSetBankAccountErrorState();
    });
  }

  set_order_car(){
    emit(setOrderCarLoadingState());
    FirebaseFirestore.instance.collection('car_details')
        .add(car_modell!.orderToMap()).then((value){
          print(car_modell?.vin_number);
          emit(setOrderCarSuccessState());
    }).catchError((){
      emit(setOrderCarErrorState());
    });
  }
}