import 'package:unirepo/core/freezed/result/result.dart';
import 'package:unirepo/features/note/data/models/note/note.dart';
import 'package:unirepo/features/home/data/repositories/get_notes_repositary_impl.dart';

class GetNotes {
  final GetNotesRepositary getNotesRepositary;
  const GetNotes({required this.getNotesRepositary});
  Future<Result<List<Note>, Exception>> call({required String universityID}) async {
    return await getNotesRepositary.getNotesByUniversity(universityID);
  }

  Future<Result<List<Note>, Exception>> getNotesByPrefix({
    required String universityID,
    required String prefixID,
  }) async {
    return await getNotesRepositary.getNotesByPrefix(universityID, prefixID);
  }
}
