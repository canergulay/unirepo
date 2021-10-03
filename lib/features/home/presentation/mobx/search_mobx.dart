import 'package:mobx/mobx.dart';
import 'package:unirepo/core/constants/app_constants.dart';
import 'package:unirepo/core/freezed/result.dart';
import 'package:unirepo/core/init/injection/get_them_all.dart';
import 'package:unirepo/core/local_manager/hive_manager.dart';
import 'package:unirepo/features/home/data/models/university.dart';
import 'package:unirepo/features/home/domain/usecases/get_all_universities.dart';

part 'search_mobx.g.dart';

class SearchMobx = _SearchMobx with _$SearchMobx;

abstract class _SearchMobx with Store {
  final GetAllUniversities _getAllUniversities = injector.get<GetAllUniversities>();

  bool _isDatasFetched = false;
  bool _isCachedDataControlled = false;

  @observable
  List<University> _universities = [];

  List<University> get universities => _universities;

  @action
  Future<void> getTall(String query) async {
    if (!_isCachedDataControlled) {
      bool isCached = await _checkDataIsCached();
      if (isCached) {
        _isCachedDataControlled = true;
      }
    }
  }

  Future<bool> _checkDataIsCached() async {
    final bool? _isCached = await HiveManager.instance.isUniversitiesCached();
    if (_isCached != null && _isCached == true) {
      return true;
    }
    return false;
  }

  Future<void> _fetcDatas() async {
    Result<List<University>, Exception> queryResult = await _getAllUniversities();
    queryResult.when(
        success: (List<University> a) {
          _universities = a;
        },
        error: (Exception e) {});
  }
}
