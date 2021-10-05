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
  bool _isCachedDataControlled = false;

  late final _universitiesStored;

  @observable
  List<String> coursePrefices = [];

  @observable
  List<University> _universities = [];

  List<University> get universities => _universities;

  @action
  Future<void> triggerFetching(String query) async {
    if (!_isCachedDataControlled) {
      bool _isCached = await _checkDataIsCached();
      if (_isCached) {
        _ifCached();
      } else {
        _fetcDatas();
      }
    } else {
      _searchAmongUniversities(query);
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
    print('datas will be fetched');
    Result<List<University>, Exception> queryResult = await _getAllUniversities();
    queryResult.when(
        success: (List<University> universitiesFetched) {
          _setUniversities(universitiesFetched);
          _cacheFetchedUniversities(universitiesFetched);
        },
        error: (Exception e) {});
  }

  void _ifCached() async {
    _isCachedDataControlled = true;
    final Result<List<University>, Exception> _cachedUniversities = await _cacheRetrieveUniversities.getCachedUniversities();
    _cachedUniversities.when(success: (List<University> universitiesCached) {
      if (universitiesCached.isNotEmpty) {
        _setUniversities(universitiesCached);
      } else {
        _fetcDatas();
      }
    }, error: (Exception e) {
      _fetcDatas();
    });
  }

  void _cacheFetchedUniversities(List<University> universities) async {
    Result<bool, Exception> result = await _cacheRetrieveUniversities.cacheUniversities(universities);
    result.when(
        success: (bool result) {
          HiveManager.instance.put<bool>(
            boxName: AppConstants.shared.hiveAppBox,
            key: AppConstants.shared.hiveIsCachedKey,
            value: true,
          );
        },
        error: (Exception e) {});
  }

  void _setUniversities(List<University> universities) {
    _universitiesStored = universities;
    _universities = universities;
  }

  void _resetUniversities() {
    _universities = _universitiesStored;
  }

  void _searchAmongUniversities(String query) {
    if (query.length < 3) {
      _resetUniversities();
    } else {
      final List<University>? filteredUniversities = _universitiesStored
          .where(
            (element) => (checkIfContainsQuery(element, query) ?? false),
          )
          .toList();
      if (filteredUniversities?.isNotEmpty ?? false) {
        _universities = filteredUniversities!;
      } else {
        _resetUniversities();
      }
    }
  }

  bool? checkIfContainsQuery(University university, String query) {
    return university.name!.contains(query.trim()) || university.name!.contains(queryIconverter(query).trim());
  }
}

String queryIconverter(String query) {
  return query.toUpperCase().replaceAll('I', 'İ');
}

bool equalsIgnoreCase(String string1, String string2) {
  return string1.toLowerCase() == string2.toLowerCase();
}
