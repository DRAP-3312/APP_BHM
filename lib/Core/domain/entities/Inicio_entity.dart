class Inicio {
  final String userName;
  final String numTarjet;
  final int cvc;
  final String news;
  final String fotoUser;
  final String fotoNews;
  final bool isValid;

  Inicio(
      {required this.userName,
      required this.numTarjet,
      required this.cvc,
      required this.news,
      required this.fotoUser,
      required this.fotoNews,
      required this.isValid});
}
