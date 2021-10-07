import 'package:unirepo/core/freezed/result.dart';
import 'package:unirepo/features/home/data/models/university/university.dart';

abstract class CachedClassRepositaryContract {
  Future<Result<List<University>, Exception>> getCachedUniversities();
  Future<Result<bool, Exception>> cacheAllUniversities(List<University> universities);
}
