import 'package:get_it/get_it.dart';
import 'package:unirepo/features/home/data/datasources/get_cached_universities_datasource.dart';
import 'package:unirepo/features/home/data/datasources/get_notes_data_source.dart';
import 'package:unirepo/features/home/data/datasources/get_schools_datasource.dart';
import 'package:unirepo/features/home/data/repositories/cached_university_repositary_impl.dart';
import 'package:unirepo/features/home/data/repositories/get_all_universities_repositary_impl.dart';
import 'package:unirepo/features/home/data/repositories/get_notes_repositary_impl.dart';
import 'package:unirepo/features/home/domain/usecases/cache_retrieve_universities.dart';
import 'package:unirepo/features/home/domain/usecases/get_notes.dart';
import 'package:unirepo/features/home/domain/usecases/get_supported_prefices.dart';
import 'package:unirepo/features/home/domain/usecases/get_universities.dart';
import 'package:unirepo/features/user/data/datasources/get_user_info_datasource.dart';
import 'package:unirepo/features/user/data/datasources/login_with_email_password.dart';
import 'package:unirepo/features/user/data/datasources/register_with_email_password_firebase_ds.dart';
import 'package:unirepo/features/user/data/repositories/get_user_info_repositary.dart';
import 'package:unirepo/features/user/data/repositories/login_with_email_password_repositary.dart';
import 'package:unirepo/features/user/data/repositories/register_with_email_password_repositary.dart';
import 'package:unirepo/features/user/domain/usecases/get_user_info.dart';
import 'package:unirepo/features/user/domain/usecases/login_with_email_password.dart';
import 'package:unirepo/features/user/domain/usecases/register_with_email_password.dart';

final injector = GetIt.instance;

void setUp() {
  _setupGetAllUniversitiesModule();
  _setupUniversityCachingModule();
  _setupGetNotesModule();
  _setupRegistrationModule();
  _setupLoginModule();
  _registerUserProfileModule();
}

void _setupGetAllUniversitiesModule() {
  injector.registerLazySingleton<GetSupportedPrefices>(() => GetSupportedPrefices(getAllUniversitiesRepositary: injector()));
  injector.registerLazySingleton<GetUniversities>(() => GetUniversities(getAllUniversitiesRepositary: injector()));
  injector.registerLazySingleton<GetUniversitiesRepositary>(() => GetUniversitiesRepositary(readUniversities: injector()));
  injector.registerLazySingleton<ReadUniversities>(() => ReadUniversities());
}

void _setupUniversityCachingModule() {
  injector.registerLazySingleton<CacheRetrieveUniversities>(() => CacheRetrieveUniversities(getCachedUniversitiesRepositary: injector()));
  injector.registerLazySingleton<CachedUniversitiesRepositary>(() => CachedUniversitiesRepositary(getCachedUniversitiesDataSource: injector()));
  injector.registerLazySingleton<GetCachedUniversitiesLocalDataSource>(() => GetCachedUniversitiesLocalDataSource());
}

void _setupGetNotesModule() {
  injector.registerLazySingleton<GetNotes>(() => GetNotes(getNotesRepositary: injector()));
  injector.registerLazySingleton<GetNotesRepositary>(() => GetNotesRepositary(getNotesDataSourse: injector()));
  injector.registerLazySingleton<GetNotesDataSource>(() => GetNotesDataSource());
}

void _setupRegistrationModule() {
  injector.registerLazySingleton<RegisterWithEmailPassword>(() => RegisterWithEmailPassword(registerWithEmailPasswordRepositary: injector()));
  injector.registerLazySingleton<RegisterWithEmailPasswordRepositary>(
      () => RegisterWithEmailPasswordRepositary(registerWithEmailPasswordFirebaseDS: injector()));
  injector.registerLazySingleton<RegisterWithEmailPasswordFirebaseDS>(() => RegisterWithEmailPasswordFirebaseDS());
}

void _setupLoginModule() {
  injector.registerLazySingleton<LoginWithEmailPassword>(
    () => LoginWithEmailPassword(
      loginWithEmailPasswordRepositary: injector(),
    ),
  );
  injector.registerLazySingleton<LoginWithEmailPasswordRepositary>(
    () => LoginWithEmailPasswordRepositary(
      loginWithEmailPasswordFirebaseDS: injector(),
    ),
  );
  injector.registerLazySingleton<LoginWithEmailPasswordFirebaseDS>(
    () => LoginWithEmailPasswordFirebaseDS(),
  );
}

void _registerUserProfileModule() {
  injector.registerLazySingleton<GetUserInfo>(() => GetUserInfo(getUserInfoRepositary: injector()));
  injector.registerLazySingleton<GetUserInfoRepositary>(() => GetUserInfoRepositary(getUserInfoDataSource: injector()));
  injector.registerLazySingleton<GetUserInfoDataSource>(() => GetUserInfoDataSource());
}
