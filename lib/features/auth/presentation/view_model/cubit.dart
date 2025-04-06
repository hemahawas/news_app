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

    authRepository
        .logIn(email, password)
        .then((_) {
          emit(AuthLogInSuccessState());
        })
        .catchError((error) {
          emit(AuthLogInErrorState(error.code.toString()));
        });
  }

  Future<void> register(String email, String password) async {
    emit(AuthRegisterLoadingState());

    authRepository
        .register(email, password)
        .then((_) {
          emit(AuthRegisterSuccessState());
        })
        .catchError((error) {
          emit(AuthRegisterErrorState(error.code.toString()));
        });
  }

  Future<void> logOut() async {
    emit(AuthLogOutLoadingState());

    authRepository
        .logOut()
        .then((_) {
          emit(AuthLogOutSuccessState());
        })
        .catchError((error) {
          emit(AuthLogOutErrorState(error.code.toString()));
        });
  }
}
