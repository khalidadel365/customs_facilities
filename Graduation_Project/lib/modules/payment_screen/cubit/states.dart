abstract class bank_account_states {}

class AppInitialState extends bank_account_states {}
class AppSetBankAccountLoadingState extends bank_account_states {}
class AppSetBankAccountSuccessState extends bank_account_states{}
class AppSetBankAccountErrorState extends bank_account_states{
}
class setOrderCarSuccessState extends bank_account_states{}
class setOrderCarLoadingState extends bank_account_states{}
class setOrderCarErrorState extends bank_account_states{}