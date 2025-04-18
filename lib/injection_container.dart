import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/core/api/dio_consumer.dart';
import 'package:news_app/features/auth/data/repo/auth_repository.dart';
import 'package:news_app/features/auth/data/repo/auth_repository_impl.dart';
import 'package:news_app/features/auth/presentation/view_model/cubit.dart';
import 'package:news_app/features/home/data/repo/home_repository.dart';
import 'package:news_app/features/home/data/repo/home_repository_impl.dart';
import 'package:news_app/features/home/presentation/view_model/cubit.dart';

final sl = GetIt.instance;
Future<void> init() async {
  // Features - Auth
  // Bloc
  sl.registerFactory(() => AuthCubit(authRepository: sl()));
  sl.registerFactory(() => HomeCubit(homeRepository: sl()));
  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(firebaseAuth: sl()),
  );
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(dioConsumer: sl()),
  );
  // External
  sl.registerLazySingleton(() => DioConsumer());
  sl.registerLazySingleton(() => FirebaseAuth.instance);
}
