import 'package:bhm_app/Core/domain/models/inicio_model.dart';
import 'package:equatable/equatable.dart';

class InicioState extends Equatable {
  final String userName;
  final String numTarjet;
  final int cvc;
  final String news;
  final String fotoUser;
  final String fotoNews;
  final bool isValid;

  const InicioState({
    this.userName = '',
    this.numTarjet = '',
    this.cvc = 0,
    this.news = '',
    this.fotoUser = '',
    this.fotoNews = '',
    this.isValid = false,
  });

  factory InicioState.fromModel(Inicio model) {
    return InicioState(
      userName: model.userName,
      numTarjet: model.numTarjet,
      cvc: model.cvc,
      news: model.news,
      fotoUser: model.fotoUser,
      fotoNews: model.fotoNews,
      isValid: true,
    );
  }

  InicioState copyWith({
    String? userName,
    String? numTarjet,
    int? cvc,
    String? news,
    String? fotoUser,
    String? fotoNews,
    bool? isValid,
  }) {
    return InicioState(
      userName: userName ?? this.userName,
      numTarjet: numTarjet ?? this.numTarjet,
      cvc: cvc ?? this.cvc,
      news: news ?? this.news,
      fotoUser: fotoUser ?? this.fotoUser,
      fotoNews: fotoNews ?? this.fotoNews,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
        userName,
        numTarjet,
        cvc,
        news,
        fotoUser,
        fotoNews,
        isValid,
      ];
}
