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
import 'package:unirepo/features/user/data/datasources/register_with_email_password_firebase_ds.dart';
import 'package:unirepo/features/user/data/repositories/register_with_email_password_repositary.dart';
import 'package:unirepo/features/user/domain/usecases/register_with_email_password.dart';

final injector = GetIt.instance;

void setUp() {
  _setupGetAllUniversitiesModule();
  _setupUniversityCachingModule();
  _setupGetNotesModule();
  _setupRegistrationModule();
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
