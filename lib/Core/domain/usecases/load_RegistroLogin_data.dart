import 'package:bhm_app/Core/domain/models/Registro_Login_model.dart';
import 'package:bhm_app/Core/domain/repositories/RegistroLogin_Repositorie.dart';

class LoadRegistroDataData {
  final RegistroLoginRepository repository;

  LoadRegistroDataData(this.repository);

  Future<RegistroLogin> call() async {
    final registroLoginData = await repository.loadRegistroLoginData();
    
    // Validaciones
    if (registroLoginData.name.isEmpty || registroLoginData.name.length > 50) {
      throw Exception("Nombre no puede ser vacío y debe tener un máximo de 50 caracteres");
    }
    if (registroLoginData.lastname.isEmpty || registroLoginData.lastname.length > 50) {
      throw Exception("Apellido no puede ser vacío y debe tener un máximo de 50 caracteres");
    }
    if (registroLoginData.email.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(registroLoginData.email)) {
      throw Exception("Email no puede ser vacío y debe tener un formato válido");
    }
    if (registroLoginData.rfc.isEmpty || registroLoginData.rfc.length > 13) {
      throw Exception("RFC no puede ser vacío y debe tener un máximo de 13 caracteres");
    }
    if (registroLoginData.phone.isEmpty || !RegExp(r'^\d{10,13}$').hasMatch(registroLoginData.phone)) {
      throw Exception("Teléfono no puede ser vacío, debe ser un número mexicano válido con un mínimo de 10 y un máximo de 13 caracteres");
    }
    if (registroLoginData.password.isEmpty || registroLoginData.password.length < 8) {
      throw Exception("Contraseña no puede ser vacía y debe tener un mínimo de 8 caracteres");
    }
    if (registroLoginData.id_banck == 0) {
      throw Exception("ID de Banco no puede ser vacío y debe ser un número");
    }

    print('Datos validados en el usecase: $registroLoginData'); // Verificar datos validados
    return registroLoginData;
  }
}
