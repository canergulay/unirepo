import 'package:unirepo/core/freezed/result/result.dart';
import 'package:unirepo/features/home/data/models/university/university.dart';
import 'package:unirepo/features/home/data/repositories/get_all_universities_repositary_impl.dart';

class GetUniversities {
  final GetUniversitiesRepositary getAllUniversitiesRepositary;
  const GetUniversities({required this.getAllUniversitiesRepositary});
  Future<Result<List<University>, Exception>> getAllUniversities() async {
    return await getAllUniversitiesRepositary.getAllUniversities();
  }
}
