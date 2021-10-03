import 'package:mobx/mobx.dart';
import 'package:unirepo/core/constants/app_constants.dart';
import 'package:unirepo/core/freezed/result.dart';
import 'package:unirepo/core/init/injection/get_them_all.dart';
import 'package:unirepo/core/local_manager/hive_manager.dart';
import 'package:unirepo/features/home/data/models/university.dart';
import 'package:unirepo/features/home/domain/usecases/cache_retrieve_universities.dart';
import 'package:unirepo/features/home/domain/usecases/get_all_universities.dart';

part 'search_mobx.g.dart';

class SearchMobx = _SearchMobx with _$SearchMobx;

abstract class _SearchMobx with Store {
  final GetAllUniversities _getAllUniversities = injector.get<GetAllUniversities>();
  final CacheRetrieveUniversities _cacheRetrieveUniversities = injector.get<CacheRetrieveUniversities>();
  bool _isDatasFetched = false;
  bool _isCachedDataControlled = false;

  @observable
  List<University> _universities = [];

  List<University> get universities => _universities;

  @action
  Future<void> triggerFetching(String query) async {
    if (!_isCachedDataControlled) {
      bool _isCached = await _checkDataIsCached();
      if (_isCached) {
        print('evet daha önce cachelenmiş');
        _ifCached();
      } else {
        print('yok cache felan');
        _fetcDatas();
      }
    } else {
      print('aruyorz');
      final List<University>? filteredUniversities =
          _universities.where((element) => (element.name!.contains(query) || element.name!.contains(query.toUpperCase()))).toList();
      if (filteredUniversities?.isNotEmpty ?? false) {
        _universities = filteredUniversities!;
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
        success: (List<University> universitiesFetched) {
          _universities = universitiesFetched;
          _cacheFetchedUniversities(universitiesFetched);
        },
        error: (Exception e) {});
    _isDatasFetched = true;
  }

  void _ifCached() async {
    _isCachedDataControlled = true;
    final Result<List<University>, Exception> _cachedUniversities = await _cacheRetrieveUniversities.getCachedUniversities();
    _cachedUniversities.when(success: (List<University> universities) {
      _universities = universities;
      print(_universities.length);
    }, error: (Exception e) {
      print('yedin');
      print(e);
    });
  }

  void _cacheFetchedUniversities(List<University> universities) async {
    Result<bool, Exception> result = await _cacheRetrieveUniversities.cacheUniversities(universities);
    result.when(success: (bool result) {
      print(result);
      HiveManager.instance.put<bool>(
        boxName: AppConstants.shared.hiveAppBox,
        key: AppConstants.shared.isCached,
        value: true,
      );
    }, error: (Exception e) {
      print(e);
    });
  }
}

bool equalsIgnoreCase(String string1, String string2) {
  return string1.toLowerCase() == string2.toLowerCase();
}
