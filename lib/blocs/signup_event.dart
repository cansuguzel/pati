import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignupButtonPressed extends SignupEvent {
  final String email;
  final String password;
  final bool acceptTerms;

  const SignupButtonPressed({
    required this.email,
    required this.password,
    required this.acceptTerms,
  });

  @override
  List<Object> get props => [email, password, acceptTerms];
}
class SignupSubmitted extends SignupEvent {}
