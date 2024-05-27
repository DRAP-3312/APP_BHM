import 'package:bhm_app/Core/presentation/bloc/bloc_login/login_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:aplicaciones_moviles_app/domain/usecases/load_form_data.dart' as usecase;


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  //final usecase.LoadFormData loadFormData;

  //this.loadFormData
  LoginBloc() : super(const LoginState()) {
    on<LoadLoginDataEvent>((event, emit) async {
      //final formData = await loadFormData();
      //emit(FormState.fromModel(formData));
    });

    on<UserEmailChanged>((event, emit) {
      emit(state.copyWith(userEmail: event.userEmail, isValid: _validateForm()));
    });
    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password, isValid: _validateForm()));
    });
    on<SaveSesionChanged>((event, emit) {
      emit(state.copyWith(saveSesion: event.saveSesion, isValid: _validateForm()));
    });

    on<LoginSubmitted>((event, emit) {
      if (state.isValid) {
        // Handle form submission logic
      }
    });
  }

  bool _validateForm() {
    return state.userEmail.isNotEmpty &&
        state.password.isNotEmpty &&
        state.saveSesion == false;
  }
}
