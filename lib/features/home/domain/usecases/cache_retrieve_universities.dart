import 'package:unirepo/core/freezed/result/result.dart';
import 'package:unirepo/features/home/data/models/university/university.dart';
import 'package:unirepo/features/home/data/repositories/cached_university_repositary_impl.dart';

class CacheRetrieveUniversities {
  final CachedUniversitiesRepositary getCachedUniversitiesRepositary;
  const CacheRetrieveUniversities({required this.getCachedUniversitiesRepositary});
  Future<Result<bool, Exception>> cacheUniversities(List<University> universities) async {
    return await getCachedUniversitiesRepositary.cacheAllUniversities(universities);
  }

  Future<Result<List<University>, Exception>> getCachedUniversities() async {
    return await getCachedUniversitiesRepositary.getCachedUniversities();
  }
}
