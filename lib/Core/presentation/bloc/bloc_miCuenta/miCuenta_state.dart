import 'package:bhm_app/Core/domain/models/micuenta_model.dart';
import 'package:equatable/equatable.dart';

class MiCuentaState extends Equatable {
  final String numCuenta;
  final String user;
  final String cell;
  final String userEmail;
  final String fotoPerfil;
  final bool isValid;

  const MiCuentaState({
    this.numCuenta = '',
    this.user = '',
    this.cell = '',
    this.userEmail = '',
    this.fotoPerfil = '',
    this.isValid = false,
  });

  factory MiCuentaState.fromModel(Micuenta model) {
    return MiCuentaState(
      numCuenta: model.numCuenta,
      user: model.user,
      cell: model.cell,
      userEmail: model.userEmail,
      fotoPerfil: model.fotoPerfil,
      isValid: true,
    );
  }

  MiCuentaState copyWith({
    String? numCuenta,
    String? user,
    String? cell,
    String? userEmail,
    String? fotoPerfil,
    bool? isValid,
  }) {
    return MiCuentaState(
      numCuenta: numCuenta ?? this.numCuenta,
      user: user ?? this.user,
      cell: cell ?? this.cell,
      userEmail: userEmail ?? this.userEmail,
      fotoPerfil: fotoPerfil ?? this.fotoPerfil,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
        numCuenta,
        user,
        cell,
        userEmail,
        fotoPerfil,
        isValid,
      ];
}
