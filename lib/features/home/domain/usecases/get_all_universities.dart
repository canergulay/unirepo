import 'package:unirepo/core/freezed/result.dart';
import 'package:unirepo/features/home/data/models/university.dart';
import 'package:unirepo/features/home/data/repositories/get_all_universities_repositary_impl.dart';

class GetAllUniversities {
  final GetAllUniversitiesRepositary getAllUniversitiesRepositary;
  const GetAllUniversities({required this.getAllUniversitiesRepositary});
  Future<Result<List<University>, Exception>> call() async {
    return await getAllUniversitiesRepositary.getAllUniversities();
  }
}
