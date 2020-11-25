part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
  });

  final Email email;
  final Password password;

  @override
  List<Object> get props => [email, password];

  // LoginState copyWith({
  //   Email email,
  //   Password password,

  // }) {
  //   return LoginState(
  //     email: email ?? this.email,
  //     password: password ?? this.password,
  //   );
  // }
}
