class GlobalState {
  static final GlobalState _instance = GlobalState._internal();

  factory GlobalState() {
    return _instance;
  }

  GlobalState._internal();

  int? userId;
  String? nameUser;

  void setUserId(int id) {
    userId = id;
  }

  void setNameUser(String name) {
    nameUser = name;
  }

  String? getNameUser() {
    return nameUser;
  }

  int? getUserId() {
    return userId;
  }
}
