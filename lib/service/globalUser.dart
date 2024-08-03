// ignore_for_file: non_constant_identifier_names

class GlobalState {
  static final GlobalState _instance = GlobalState._internal();

  factory GlobalState() {
    return _instance;
  }

  GlobalState._internal();

  int? userId;
  String? nameUser;
  int? id_account;
  String? card;
  int? balance;

  void setUserId(int id) {
    userId = id;
  }

  void setNameUser(String name) {
    nameUser = name;
  }

  void setidAccount(int idAccount){
    id_account = idAccount;
  }

  String? getNameUser() {
    return nameUser;
  }

  int? getUserId() {
    return userId;
  }

  int? getIdAccount(){
    return id_account;
  }

  void setCard(String newCard){
    card = newCard;
  }

  String? getCard(){
    return card;
  }

  void setBalance(int money){
    balance = money;
  }

  int? getBalance(){
    return balance;
  }
}
