import 'package:get_it/get_it.dart';
import 'package:unirepo/features/home/data/datasources/get_cached_universities_datasource.dart';
import 'package:unirepo/features/home/data/datasources/get_schools_datasource.dart';
import 'package:unirepo/features/home/data/repositories/cached_university_repositary_impl.dart';
import 'package:unirepo/features/home/data/repositories/get_all_universities_repositary_impl.dart';
import 'package:unirepo/features/home/domain/usecases/cache_retrieve_universities.dart';
import 'package:unirepo/features/home/domain/usecases/get_all_universities.dart';

final injector = GetIt.instance;

void setUp() {
  _setupGetAllUniversitiesModule();
  _setupUniversityCachingModule();
}

void _setupGetAllUniversitiesModule() {
  injector.registerLazySingleton<GetAllUniversities>(() => GetAllUniversities(getAllUniversitiesRepositary: injector()));
  injector.registerLazySingleton<GetAllUniversitiesRepositary>(() => GetAllUniversitiesRepositary(readUnivercities: injector()));
  injector.registerLazySingleton<ReadUniversities>(() => ReadUniversities());
}

void _setupUniversityCachingModule() {
  injector.registerLazySingleton<CacheRetrieveUniversities>(() => CacheRetrieveUniversities(getCachedUniversitiesRepositary: injector()));
  injector.registerLazySingleton<CachedUniversitiesRepositary>(() => CachedUniversitiesRepositary(getCachedUniversitiesDataSource: injector()));
  injector.registerLazySingleton<GetCachedUniversitiesLocalDataSource>(() => GetCachedUniversitiesLocalDataSource());
}
