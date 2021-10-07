import 'package:hive/hive.dart';
import 'package:unirepo/core/constants/app_constants.dart';
import 'package:unirepo/features/home/data/models/university/university.dart';

class HiveManager {
  static HiveManager _instace = HiveManager._init();
  static HiveManager get instance => _instace;
  HiveManager._init();

  Future<bool?> isUniversitiesCached() async {
    final box = await Hive.openBox(AppConstants.shared.hiveAppBox);
    bool? isCached = box.get(AppConstants.shared.hiveIsCachedKey);
    return isCached;
  }

  Future<void> openBox({required String boxName}) async {
    await Hive.openBox(boxName);
  }

  Future<void> closeBox({required String boxName}) async {
    final hiveBox = Hive.box(boxName);
    await hiveBox.close();
  }

  Future<void> put<T>({required String boxName, required key, required T value}) async {
    late final box;
    if (Hive.isBoxOpen(boxName)) {
      box = Hive.box(boxName);
    } else {
      box = await Hive.openBox(boxName);
    }
    box.put(key, value);
  }

  Future<List<T>> getAll<T>({required String boxName}) async {
    final box = Hive.box(boxName);
    print('heyyoo');
    print(box.length);
    final List<T> _listToReturn = [];
    for (int i = 0; i < box.length; i++) {
      final value = await box.getAt(i);
      _listToReturn.add(value);
    }
    print('returndan onceli son yer');
    return _listToReturn;
  }

  Future<void> putAll<T>({required String boxName, required List<T> listToBePut}) async {
    final box = Hive.box(boxName);
    for (int i = 0; i < listToBePut.length; i++) {
      box.put(i, listToBePut[i]);
    }
    print(box.length);
  }

  void clearBox({required String boxName}) {
    bool isBoxOpen = Hive.isBoxOpen(boxName);
    if (isBoxOpen) {
      Hive.box(boxName).clear();
    } else {
      Hive.openBox(boxName).then((box) => box.clear());
    }
  }

  Future<void> pickUniversity(University university) async {
    final box = Hive.box(AppConstants.shared.hivePickedUniversityBox);
    await box.put(
      AppConstants.shared.hivePickedUniversityNameKey,
      university.name,
    );
    await box.put(
      AppConstants.shared.hivePickedUniversityidKey,
      university.id,
    );

    print(box.length);
  }

  Future<dynamic> get({required String boxName, required String key}) async {
    return await Hive.box(boxName).get(key);
  }
}
