import 'package:unirepo/core/freezed/result.dart';
import 'package:unirepo/features/home/data/models/course_prefix/course_prefix.dart';
import 'package:unirepo/features/home/data/repositories/get_all_universities_repositary_impl.dart';

class GetSupportedPrefices {
  final GetUniversitiesRepositary getAllUniversitiesRepositary;
  GetSupportedPrefices({required this.getAllUniversitiesRepositary});
  Future<Result<List<CoursePrefix>, Exception>> call(String docID) async {
    return await getAllUniversitiesRepositary.getSupportedPrefices(docID);
  }
}
