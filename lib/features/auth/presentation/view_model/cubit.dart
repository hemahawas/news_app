import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/auth/data/repo/auth_repository.dart';
import 'package:news_app/features/auth/presentation/view_model/states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit({required this.authRepository}) : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  AuthRepository authRepository;

  bool isPasswordVisible = false;
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(AuthTogglePasswordVisibilityState());
  }

  Future<void> logIn(String email, String password) async {
    emit(AuthLogInLoadingState());
    try {
      authRepository.logIn(email, password);
      emit(AuthLogInSuccessState());
    } catch (error) {
      emit(AuthLogInErrorState(error.toString()));
    }
  }

  Future<void> register(String email, String password) async {
    emit(AuthRegisterLoadingState());
    try {
      authRepository.register(email, password);
      emit(AuthRegisterSuccessState());
    } catch (error) {
      emit(AuthRegisterErrorState(error.toString()));
    }
  }

  Future<void> logOut(String email, String password) async {
    emit(AuthRegisterLoadingState());
    try {
      authRepository.logOut();
      emit(AuthRegisterSuccessState());
    } catch (error) {
      emit(AuthRegisterErrorState(error.toString()));
    }
  }
}
