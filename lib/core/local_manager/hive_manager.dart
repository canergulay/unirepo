import 'package:hive/hive.dart';
import 'package:unirepo/core/constants/app_constants.dart';

class HiveManager {
  static HiveManager _instace = HiveManager._init();
  static HiveManager get instance => _instace;
  HiveManager._init();

  Future<bool?> isUniversitiesCached() async {
    final box = await Hive.openBox(AppConstants.shared.hiveAppBox);
    bool? isCached = box.get('iscached');
    return isCached;
  }

  Future<void> openBox({required String boxName}) async {
    await Hive.openBox(boxName);
  }

  Future<void> closeBox({required String boxName}) async {
    final hiveBox = Hive.box(boxName);
    await hiveBox.close();
  }

  Future<void> put({required String boxName, required key, required Object value}) async {
    final box = await Hive.openBox(boxName);
    box.put(key, value);
  }

  Future<List<T>> getAll<T>({required String boxName}) async {
    final box = Hive.box(boxName);
    final List<T> _listToReturn = [];
    for (int i = 0; i < box.length; i++) {
      final value = await box.getAt(i);
      _listToReturn.add(value);
    }
    return _listToReturn;
  }

  Future<void> putAll<T>({required String boxName, required List<T> listToBePut}) async {
    final box = Hive.box(boxName);
    for (int i = 0; i < listToBePut.length; i++) {
      box.putAt(i, listToBePut[i]);
    }
  }

  Future<dynamic> get({required String boxName, required String key}) async {}
}
