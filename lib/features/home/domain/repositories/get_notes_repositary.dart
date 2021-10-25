import 'package:unirepo/core/freezed/result/result.dart';
import 'package:unirepo/features/note/data/models/note/note.dart';

abstract class GetNotesRepositaryContract {
  Future<Result<List<Note>, Exception>> getNotesByUniversity(String universityID);
  Future<Result<List<Note>, Exception>> getNotesByPrefix(String universityID, String prefix);
}
