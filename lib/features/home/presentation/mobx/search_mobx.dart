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
  List<University> universities = [];

  @action
  Future<void> getTall() async {
    Result<List<University>, Exception> queryResult = await _getAllUniversities.call();
    queryResult.when(success: (a) {
      print(a);
    }, error: (Exception e) {
      print(e);
    });
  }
}
