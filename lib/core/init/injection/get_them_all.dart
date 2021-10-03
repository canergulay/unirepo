import 'package:get_it/get_it.dart';
import 'package:unirepo/features/home/data/datasources/get_schools_datasource.dart';
import 'package:unirepo/features/home/data/repositories/get_all_universities_repositary_impl.dart';
import 'package:unirepo/features/home/domain/usecases/get_all_universities.dart';

final injector = GetIt.instance;

void setUp() {
  injector.registerLazySingleton<GetAllUniversities>(() => GetAllUniversities(getAllUniversitiesRepositary: injector()));
  injector.registerLazySingleton<GetAllUniversitiesRepositary>(() => GetAllUniversitiesRepositary(readUnivercities: injector()));
  injector.registerLazySingleton<ReadUnivercities>(() => ReadUnivercities());
}
