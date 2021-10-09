import 'package:unirepo/core/freezed/result/result.dart';
import 'package:unirepo/features/home/data/models/note/note.dart';

abstract class GetNotesRepositaryContract {
  Future<Result<List<Note>, Exception>> getNotesByUniversity(String universityID);
}
