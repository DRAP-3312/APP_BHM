class GlobalState {
  static final GlobalState _instance = GlobalState._internal();

  factory GlobalState() {
    return _instance;
  }

  GlobalState._internal();

  int? userId;

  void setUserId(int id) {
    userId = id;
  }

  int? getUserId() {
    return userId;
  }
}
