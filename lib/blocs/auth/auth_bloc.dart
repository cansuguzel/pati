import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());

      await Future.delayed(const Duration(seconds: 2));

      if (event.email == "test@example.com" && event.password == "123456") {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure(error: "Geçersiz e-posta veya şifre"));
      }
    });
  }
}
