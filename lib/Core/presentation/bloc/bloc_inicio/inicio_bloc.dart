import 'package:bhm_app/Core/presentation/bloc/bloc_inicio/inicio_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_inicio/inicio_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:aplicaciones_moviles_app/domain/usecases/load_form_data.dart' as usecase;


class InicioBloc extends Bloc<InicioEvent, InicioState> {
  //final usecase.LoadFormData loadFormData;

  //this.loadFormData
  InicioBloc() : super(const InicioState()) {
    on<LoadInicioDataEvent>((event, emit) async {
      //final formData = await loadFormData();
      //emit(FormState.fromModel(formData));
    });

    on<UserNameChanged>((event, emit) {
      emit(state.copyWith(userName: event.userName, isValid: _validateForm()));
    });
    on<NumTarjetChanged>((event, emit) {
      emit(state.copyWith(numTarjet: event.numTarjet, isValid: _validateForm()));
    });
    on<cvcChanged>((event, emit) {
      emit(state.copyWith(cvc: event.cvc, isValid: _validateForm()));
    });
    on<NewsChanged>((event, emit) {
      emit(state.copyWith(news: event.news, isValid: _validateForm()));
    });
    on<FotoUserChanged>((event, emit) {
      emit(state.copyWith(fotoUser: event.fotoUser, isValid: _validateForm()));
    });
    on<FotoNewChanged>((event, emit) {
      emit(state.copyWith(fotoNews: event.fotoNews, isValid: _validateForm()));
    });
    on<InicioSubmitted>((event, emit) {
      if (state.isValid) {
        // Handle form submission logic
      }
    });
  }

  bool _validateForm() {
    return state.userName.isNotEmpty &&
        state.numTarjet.isNotEmpty &&
        state.cvc==0 &&
        state.news.isNotEmpty &&
        state.fotoUser.isNotEmpty &&
        state.fotoNews.isNotEmpty;
  }
}
