import 'package:graduation_project/shared/component/constants.dart';

class bank_account_model{
  String? card_num;
  String? full_name;
  String? cvv;
  String? exp_date;
  String? id ;

  bank_account_model({
    required this.card_num,
    required this.full_name,
    required this.cvv,
    required this.exp_date,
    required this.id,
  });

  Map<String,dynamic> resToMap(){
    return{
      'cardNumber': card_num,
      'cvv': cvv,
      'expirationDate': exp_date,
      'name':full_name,
      'user_id':id,
    };
  }
}