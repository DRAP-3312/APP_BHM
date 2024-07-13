// import 'package:bhm_app/Core/domain/usecases/load_RegistroLogin_data.dart'
//     as usecase;
// import 'package:bhm_app/Core/presentation/bloc/bloc_RegistroLogin/RegistroLogin_event.dart';
// import 'package:bhm_app/Core/presentation/bloc/bloc_RegistroLogin/RegistroLogin_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class RegistroLoginBloc extends Bloc<RegistroLoginEvent, RegistroLoginState> {
//   final usecase.LoadRegistroDataData loadRegistroLoginData;

//     RegistroLoginBloc(this.loadRegistroLoginData)
//       : super(const RegistroLoginState()) {
//     on<LoadRegistroLoginDataEvent>((event, emit) async {
//       try {
//         final registroLoginData = await loadRegistroLoginData();
//         print('Datos recibidos en el Bloc: $registroLoginData'); // Verificar datos
//         emit(RegistroLoginState.fromModel(registroLoginData));
//         print('Estado actualizado en el Bloc: $registroLoginData'); // Verificar estado actualizado
//       } catch (e) {
//         print('Error al cargar datos: $e'); // Capturar cualquier error
//       }
//     });

//     on<NameChanged>((event, emit) {
//       emit(state.copyWith(name: event.name, isValid: _validateForm()));
//     });
//     on<LastNameChanged>((event, emit) {
//       emit(state.copyWith(lastname: event.lastname, isValid: _validateForm()));
//     });
//     on<EmailChanged>((event, emit) {
//       emit(state.copyWith(email: event.email, isValid: _validateForm()));
//     });
//     on<RfcChanged>((event, emit) {
//       emit(state.copyWith(rfc: event.rfc, isValid: _validateForm()));
//     });
//     on<PhoneChanged>((event, emit) {
//       emit(state.copyWith(phone: event.phone, isValid: _validateForm()));
//     });
//     on<PassowordChanged>((event, emit) {
//       emit(state.copyWith(password: event.password, isValid: _validateForm()));
//     });
//     on<IdbanckChanged>((event, emit) {
//       emit(state.copyWith(id_banck: event.id_banck, isValid: _validateForm()));
//     });

//     on<RegistroLoginSubmitted>((event, emit) {
//       if (state.isValid) {
//         // Handle form submission logic
//       }
//     });
//   }

//   bool _validateForm() {
//     return state.name.isNotEmpty &&
//         state.lastname.isNotEmpty &&
//         state.email.isNotEmpty &&
//         state.rfc.isNotEmpty &&
//         state.phone.isNotEmpty &&
//         state.password.isNotEmpty &&
//         state.id_banck == 0;
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bhm_app/Core/domain/models/Registro_Login_model.dart';
import 'package:bhm_app/Core/domain/usecases/load_RegistroLogin_data.dart' as usecase;
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

  Future<void> _onLoadRegistroLoginDataEvent(
      LoadRegistroLoginDataEvent event, Emitter<RegistroLoginState> emit) async {
    try {
      final registroLoginData = await loadRegistroLoginData();
      emit(RegistroLoginState.fromModel(registroLoginData));
    } catch (e) {
      print('Error al cargar datos: $e'); // Capturar cualquier error
    }
  }

  void _onNameChanged(NameChanged event, Emitter<RegistroLoginState> emit) {
    emit(state.copyWith(name: event.name, isValid: _validateForm()));
  }

  void _onLastNameChanged(LastNameChanged event, Emitter<RegistroLoginState> emit) {
    emit(state.copyWith(lastname: event.lastname, isValid: _validateForm()));
  }

  void _onEmailChanged(EmailChanged event, Emitter<RegistroLoginState> emit) {
    emit(state.copyWith(email: event.email, isValid: _validateForm()));
  }

  void _onRfcChanged(RfcChanged event, Emitter<RegistroLoginState> emit) {
    emit(state.copyWith(rfc: event.rfc, isValid: _validateForm()));
  }

  void _onPhoneChanged(PhoneChanged event, Emitter<RegistroLoginState> emit) {
    emit(state.copyWith(phone: event.phone, isValid: _validateForm()));
  }

  void _onPasswordChanged(PassowordChanged event, Emitter<RegistroLoginState> emit) {
    emit(state.copyWith(password: event.password, isValid: _validateForm()));
  }

  void _onIdbanckChanged(IdbanckChanged event, Emitter<RegistroLoginState> emit) {
    emit(state.copyWith(id_banck: event.id_banck, isValid: _validateForm()));
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

      final success = await repository.registerUser(user);
      if (success) {
        emit(state.copyWith(isValid: true));
        add(RegistroLoginSuccess());
      } else {
        add(RegistroLoginFailure());
      }
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
    return state.name.isNotEmpty &&
        state.lastname.isNotEmpty &&
        state.email.isNotEmpty &&
        state.rfc.isNotEmpty &&
        state.phone.isNotEmpty &&
        state.password.isNotEmpty &&
        state.id_banck != 0;
  }
}
