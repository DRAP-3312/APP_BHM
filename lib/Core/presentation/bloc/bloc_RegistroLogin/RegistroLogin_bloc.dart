import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bhm_app/Core/domain/models/Registro_Login_model.dart';
import 'package:bhm_app/Core/domain/usecases/load_RegistroLogin_data.dart'
    as usecase;
import 'package:bhm_app/Core/presentation/bloc/bloc_RegistroLogin/RegistroLogin_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_RegistroLogin/RegistroLogin_state.dart';
import 'package:bhm_app/Core/domain/repositories/RegistroLogin_Repositorie.dart';

class RegistroLoginBloc extends Bloc<RegistroLoginEvent, RegistroLoginState> {
  final usecase.LoadRegistroDataData loadRegistroLoginData;
  final RegistroLoginRepository repository;

  RegistroLoginBloc(this.loadRegistroLoginData, this.repository)
      : super(const RegistroLoginState()) {
    on<LoadRegistroLoginDataEvent>(_onLoadRegistroLoginDataEvent);
    on<NameChanged>(_onNameChanged);
    on<LastNameChanged>(_onLastNameChanged);
    on<EmailChanged>(_onEmailChanged);
    on<RfcChanged>(_onRfcChanged);
    on<PhoneChanged>(_onPhoneChanged);
    on<PassowordChanged>(_onPasswordChanged);
    on<IdbanckChanged>(_onIdbanckChanged);
    on<RegistroLoginSubmitted>(_onRegistroLoginSubmitted);
    on<RegistroLoginSuccess>(_onRegistroLoginSuccess);
    on<RegistroLoginFailure>(_onRegistroLoginFailure);
  }

  Future<void> _onLoadRegistroLoginDataEvent(LoadRegistroLoginDataEvent event,
      Emitter<RegistroLoginState> emit) async {
    try {
      final registroLoginData = await loadRegistroLoginData();
      emit(RegistroLoginState.fromModel(registroLoginData));
    } catch (e) {
      print('Error al cargar datos: $e'); // Capturar cualquier error
    }
  }

  void _onNameChanged(NameChanged event, Emitter<RegistroLoginState> emit) {
    final name = event.name;
    String? errorMessage;

    if (name.isEmpty) {
      errorMessage = 'El nombre no puede estar vacío.';
    } else if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(name)) {
      errorMessage = 'El nombre solo puede contener letras y espacios.';
    }

    emit(state.copyWith(
      name: name,
      errors: {...state.errors, 'name': errorMessage},
      isValid: _validateForm(),
    ));
  }

  void _onLastNameChanged(
      LastNameChanged event, Emitter<RegistroLoginState> emit) {
    final lastname = event.lastname;
    String? errorMessage;

    if (lastname.isEmpty) {
      errorMessage = 'El apellido no puede estar vacío.';
    } else if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(lastname)) {
      errorMessage = 'El apellido solo puede contener letras y espacios.';
    }

    emit(state.copyWith(
      lastname: lastname,
      errors: {...state.errors, 'lastname': errorMessage},
      isValid: _validateForm(),
    ));
  }

  void _onEmailChanged(EmailChanged event, Emitter<RegistroLoginState> emit) {
    final email = event.email;
    String? errorMessage;

    if (email.isEmpty) {
      errorMessage = 'El correo electrónico no puede estar vacío.';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      errorMessage = 'Ingrese un correo electrónico válido.';
    }

    emit(state.copyWith(
      email: email,
      errors: {...state.errors, 'email': errorMessage},
      isValid: _validateForm(),
    ));
  }

  void _onRfcChanged(RfcChanged event, Emitter<RegistroLoginState> emit) {
    final rfc = event.rfc.toUpperCase();
    String? errorMessage;

    if (rfc.isEmpty) {
      errorMessage = 'El RFC no puede estar vacío.';
    } else if (!RegExp(
            r'^([A-ZÑ&]{3,4})?\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])[A-Z\d]{2}[A\d]$')
        .hasMatch(rfc)) {
      errorMessage = 'Ingrese un RFC válido.';
    }

    emit(state.copyWith(
      rfc: rfc,
      errors: {...state.errors, 'rfc': errorMessage},
    ));

    emit(state.copyWith(isValid: _validateForm()));
  }

  void _onPhoneChanged(PhoneChanged event, Emitter<RegistroLoginState> emit) {
    final phone = event.phone;
    String? errorMessage;

    if (phone.isEmpty) {
      errorMessage = 'El número de teléfono no puede estar vacío.';
    } else if (!RegExp(r'^\d{10}$').hasMatch(phone)) {
      errorMessage = 'Ingrese un número de teléfono válido de 10 dígitos.';
    }

    emit(state.copyWith(
      phone: phone,
      errors: {...state.errors, 'phone': errorMessage},
      isValid: _validateForm(),
    ));
  }

  void _onPasswordChanged(
      PassowordChanged event, Emitter<RegistroLoginState> emit) {
    final password = event.password;
    String? errorMessage;

    if (password.isEmpty) {
      errorMessage = 'La contraseña no puede estar vacía.';
    } else if (password.length < 8) {
      errorMessage = 'La contraseña debe tener al menos 8 caracteres.';
    } else if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$')
        .hasMatch(password)) {
      errorMessage =
          'La contraseña debe contener al menos una letra mayúscula, una letra minúscula, un número y un carácter especial.';
    }

    emit(state.copyWith(
      password: password,
      errors: {...state.errors, 'password': errorMessage},
    ));

    emit(state.copyWith(isValid: _validateForm()));
  }

  void _onIdbanckChanged(
      IdbanckChanged event, Emitter<RegistroLoginState> emit) {
    final idBanck = event.id_banck;
    String? errorMessage;

    if (idBanck == 0) {
      errorMessage = 'El ID de banco no puede estar vacío o ser cero.';
    } else if (idBanck < 0) {
      errorMessage = 'El ID de banco debe ser un número entero positivo.';
    }

    emit(state.copyWith(
      id_banck: idBanck,
      errors: {...state.errors, 'id_banck': errorMessage},
      isValid: _validateForm(),
    ));
  }

  Future<void> _onRegistroLoginSubmitted(
      RegistroLoginSubmitted event, Emitter<RegistroLoginState> emit) async {
    if (state.isValid) {
      final user = RegistroLogin(
        name: state.name,
        lastname: state.lastname,
        email: state.email,
        rfc: state.rfc,
        phone: state.phone,
        password: state.password,
        id_banck: state.id_banck,
      );

      try {
        final success = await repository.registerUser(user);
        if (success) {
          emit(const RegistroLoginState(errors: {}, isValid: true));

          add(RegistroLoginSuccess());
        } else {
          emit(state.copyWith(
            errors: {
              ...state.errors,
              'submission': 'Registro fallido, inténtalo de nuevo.'
            },
            isValid: false,
          ));
          await Future.delayed(Duration(seconds: 2), () {
            emit(state.copyWith(isValid: true));
          });
          add(RegistroLoginFailure());
        }
      } catch (e) {
        emit(state.copyWith(
          errors: {...state.errors, 'submission': 'Error en el registro: $e'},
          isValid: false,
        ));
        await Future.delayed(Duration(seconds: 2), () {
          emit(state.copyWith(isValid: true));
        });
        add(RegistroLoginFailure());
      }
    } else {
      emit(state.copyWith(
        errors: {
          ...state.errors,
          'submission': 'Por favor complete todos los campos correctamente.'
        },
        isValid: false,
      ));
    }
  }

  void _onRegistroLoginSuccess(
      RegistroLoginSuccess event, Emitter<RegistroLoginState> emit) {
    // Maneja el éxito del registro
  }

  void _onRegistroLoginFailure(
      RegistroLoginFailure event, Emitter<RegistroLoginState> emit) {
    // Maneja el fallo del registro
  }

  bool _validateForm() {
    bool isValidName =
        (state.errors['name'] == null || state.errors['name']!.isEmpty) &&
            state.name.isNotEmpty;
    bool isValidLastName = (state.errors['lastname'] == null ||
            state.errors['lastname']!.isEmpty) &&
        state.lastname.isNotEmpty;
    bool isValidEmail =
        (state.errors['email'] == null || state.errors['email']!.isEmpty) &&
            state.email.isNotEmpty;
    bool isValidRfc =
        (state.errors['rfc'] == null || state.errors['rfc']!.isEmpty) &&
            state.rfc.isNotEmpty;
    bool isValidPhone =
        (state.errors['phone'] == null || state.errors['phone']!.isEmpty) &&
            state.phone.isNotEmpty;
    bool isValidPassword = (state.errors['password'] == null ||
            state.errors['password']!.isEmpty) &&
        state.password.isNotEmpty;
    bool isValidIdBank = (state.errors['id_banck'] == null ||
            state.errors['id_banck']!.isEmpty) &&
        state.id_banck > 0;

    return isValidName &&
        isValidLastName &&
        isValidEmail &&
        isValidRfc &&
        isValidPhone &&
        isValidPassword &&
        isValidIdBank;
  }
}
