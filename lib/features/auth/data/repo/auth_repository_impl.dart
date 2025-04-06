import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/features/auth/data/repo/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  FirebaseAuth firebaseAuth;

  AuthRepositoryImpl({required this.firebaseAuth});

  @override
  Future<void> logIn(String email, String password) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> register(String email, String password) async {
    await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logOut() async {
    await firebaseAuth.signOut();
  }
}
