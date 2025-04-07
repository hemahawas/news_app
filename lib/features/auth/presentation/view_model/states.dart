abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLogInLoadingState extends AuthStates {}

class AuthLogInSuccessState extends AuthStates {}

class AuthLogInErrorState extends AuthStates {
  final String error;
  AuthLogInErrorState(this.error);
}

class AuthRegisterLoadingState extends AuthStates {}

class AuthRegisterSuccessState extends AuthStates {}

class AuthRegisterErrorState extends AuthStates {
  final String error;
  AuthRegisterErrorState(this.error);
}

class AuthTogglePasswordVisibilityState extends AuthStates {}

class AuthLogOutLoadingState extends AuthStates {}

class AuthLogOutSuccessState extends AuthStates {}

class AuthLogOutErrorState extends AuthStates {
  final String error;
  AuthLogOutErrorState(this.error);
}
