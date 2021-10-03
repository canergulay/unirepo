import 'package:mobx/mobx.dart';
import 'package:unirepo/core/freezed/result.dart';
import 'package:unirepo/core/init/injection/get_them_all.dart';
import 'package:unirepo/features/home/data/models/university.dart';
import 'package:unirepo/features/home/domain/usecases/get_all_universities.dart';

part 'search_mobx.g.dart';

class SearchMobx = _SearchMobx with _$SearchMobx;

abstract class _SearchMobx with Store {
  final GetAllUniversities _getAllUniversities = injector.get<GetAllUniversities>();
  @observable
  List<University> _universities = [];

  List<University> get universities => _universities;

  @action
  Future<void> getTall(String query) async {
    Result<List<University>, Exception> queryResult = await _getAllUniversities();
    queryResult.when(success: (List<University> a) {
      print(a.length);
      _universities = a;
    }, error: (Exception e) {
      print(e);
    });
  }
}
