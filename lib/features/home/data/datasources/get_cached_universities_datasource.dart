import 'package:unirepo/core/constants/app_constants.dart';
import 'package:unirepo/core/local_manager/hive_manager.dart';
import 'package:unirepo/features/home/data/models/university/university.dart';

class GetCachedUniversitiesLocalDataSource {
  Future<List<University>> getCachedUniversities() async {
    print('burası');
    await HiveManager.instance.openBox(
      boxName: AppConstants.shared.hiveUniverSitiesBox,
    );
    List<University> _universities = await HiveManager.instance.getAll<University>(
      boxName: AppConstants.shared.hiveUniverSitiesBox,
    );
    print('sasa');
    await HiveManager.instance.closeBox(
      boxName: AppConstants.shared.hiveUniverSitiesBox,
    );

    return _universities;
  }

  Future<void> cacheAllUniversities({required List<University> universities}) async {
    await HiveManager.instance.openBox(
      boxName: AppConstants.shared.hiveUniverSitiesBox,
    );
    await HiveManager.instance.putAll<University>(
      boxName: AppConstants.shared.hiveUniverSitiesBox,
      listToBePut: universities,
    );
    await HiveManager.instance.closeBox(
      boxName: AppConstants.shared.hiveUniverSitiesBox,
    );
  }
}
