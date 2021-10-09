import 'package:unirepo/core/freezed/result/result.dart';
import 'package:unirepo/features/home/data/datasources/get_notes_data_source.dart';
import 'package:unirepo/features/home/data/models/note/note.dart';
import 'package:unirepo/features/home/data/models/university/university.dart';
import 'package:unirepo/features/home/domain/repositories/get_all_schools_repositary.dart';
import 'package:unirepo/features/home/domain/repositories/get_notes_repositary.dart';

class GetNotesRepositary implements GetNotesRepositaryContract {
  final GetNotesDataSource getNotesDataSourse;
  const GetNotesRepositary({required this.getNotesDataSourse});
  @override
  Future<Result<List<Note>, Exception>> getNotesByUniversity(String universityID) async {
    try {
      final List<Note> notes = await getNotesDataSourse.getNotes(universityID);
      return Result.success(notes);
    } catch (e) {
      print(e);
      return Result.error(Exception());
    }
  }
}
