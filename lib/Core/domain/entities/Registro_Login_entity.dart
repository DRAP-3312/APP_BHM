
class RegistroLogin{
  final int id;
  final String name;
  final String lastname;
  final String email;
  final String rfc;
  final String phone;
  final String password;
  // ignore: non_constant_identifier_names
  final int id_banck;
  final bool isValid;

  RegistroLogin({
    required this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.rfc,
    required this.phone,
    required this.password,
      // ignore: non_constant_identifier_names
    required this.id_banck,
    required this.isValid
  });
}


