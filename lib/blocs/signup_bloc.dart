import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupButtonPressed>(_onSignup);
  }

  Future<void> _onSignup(
      SignupButtonPressed event, Emitter<SignupState> emit) async {
    if (event.email.isEmpty || event.password.isEmpty) {
      emit(SignupFailure("E-posta ve şifre boş olamaz!"));
      return;
    }

    if (!event.acceptTerms) {
      emit(SignupFailure("Şartları kabul etmelisiniz!"));
      return;
    }

    emit(SignupLoading());

    await Future.delayed(const Duration(seconds: 2));

    // Simülasyon: Şifre en az 6 karakter olmalı
    if (event.password.length < 6) {
      emit(SignupFailure("Şifre en az 6 karakter olmalıdır!"));
      return;
    }

    emit(SignupSuccess());
  }
  
}
