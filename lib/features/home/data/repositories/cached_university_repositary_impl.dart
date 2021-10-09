import 'package:unirepo/core/freezed/result/result.dart';
import 'package:unirepo/features/home/data/datasources/get_cached_universities_datasource.dart';
import 'package:unirepo/features/home/data/models/university/university.dart';
import 'package:unirepo/features/home/domain/repositories/get_cached_schools_repositary.dart';

class CachedUniversitiesRepositary implements CachedClassRepositaryContract {
  const CachedUniversitiesRepositary({required this.getCachedUniversitiesDataSource});
  final GetCachedUniversitiesLocalDataSource getCachedUniversitiesDataSource;
  @override
  Future<Result<List<University>, Exception>> getCachedUniversities() async {
    try {
      final List<University> universities = await getCachedUniversitiesDataSource.getCachedUniversities();

      return Result.success(universities);
    } catch (e) {
      return Result.error(Exception());
    }
  }

  @override
  Future<Result<bool, Exception>> cacheAllUniversities(List<University> universities) async {
    try {
      await getCachedUniversitiesDataSource.cacheAllUniversities(universities: universities);
      return const Result.success(true);
    } catch (e) {
      print(e);
      return Result.error(Exception());
    }
  }
}
