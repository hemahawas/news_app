abstract class AuthRepository {
  Future<void> logIn(String email, String password);
  Future<void> register(String email, String password);
  Future<void> logOut();
}
