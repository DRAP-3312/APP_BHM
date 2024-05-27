class Login {
  final String userEmail;
  final String password;
  final bool saveSesion;
  final bool isValid;

  Login({
    required this.userEmail,
    required this.password,
    required this.saveSesion,
    required this.isValid
  });
}
