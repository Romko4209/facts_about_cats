import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository)
      : assert(_authenticationRepository != null),
        super(LoginState());

  final AuthenticationRepository _authenticationRepository;

  Future<void> logInWithGoogle() async {
    await _authenticationRepository.logInWithGoogle();
  }

  Future<void> logInWithFacebook() async {
    await _authenticationRepository.logInWithFacebook();
  }
}
