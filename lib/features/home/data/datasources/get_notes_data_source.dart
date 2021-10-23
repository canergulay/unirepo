import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unirepo/core/constants/palette.dart';
import 'package:unirepo/core/firebase_manager/mixins/get_documents_mixin.dart';
import 'package:unirepo/features/home/data/models/course_prefix/course_prefix.dart';
import 'package:unirepo/features/home/data/models/note/note.dart';
import 'package:unirepo/features/home/data/models/university/university.dart';
import 'package:unirepo/features/user/data/models/user.dart';

class GetNotesDataSource with GetDocumentsMixin<Note> {
  GetNotesDataSource();

  Future<List<Note>> getNotes(String universityID) async {
    var rawDocuments = await getRawDocuments(
      responseType: Note(),
      whereField: 'university_id',
      isEqualTo: FirebaseFirestore.instance.collection('univercities').doc(universityID),
    );

    final List<Note> notes = await parseThem(rawDocuments);
    return notes;
  }

  Future<List<Note>> getNotesByPrefix(String universityID, String prefixID) async {
    var rawDocuments = await getRawDocumentsMultiWhere(
      responseType: Note(),
      whereField: 'university_id',
      isEqualTo: FirebaseFirestore.instance.collection('univercities').doc(universityID),
      whereField2: 'course_prefix',
      isEqualTo2: FirebaseFirestore.instance.collection('courses').doc(prefixID),
    );
    final List<Note> notes = await parseThem(rawDocuments);
    return notes;
  }
}

Future<List<Note>> parseThem(QuerySnapshot<Map<String, dynamic>> rawDocuments) async {
  // I KNOW THIS PART LOOKS A LITTLE BIT DISGUISTING
  // YET, I HAVE NOTHING TO DO WITH THAT COMPLEXICITY.
  // I HAD TO PARSE IT MANUALLY SINCE FIREBASE DOES NOT SUPPORT NEITHER INNER JOIN NOR POPULATE METHOD.
  // YOU HAVE TO POPULATE EACH REFERENCE MANUALLY..
  // THAT'S ONE OF THE REASONS WHY I HATE IT.

  List<Note> _toBeReturned = [];
  for (var note in rawDocuments.docs) {
    final data = note.data();
    final coursePrefix = await (note.data()['course_prefix'] as DocumentReference).get();
    final sharedBy = await (note.data()['shared_by'] as DocumentReference).get();

    final List<String?>? photos = [];
    (data['documents'] as List<dynamic>).getRange(0, Palette.instance.documentShownSize).forEach((element) {
      photos?.add(element.toString());
    });

    final DateTime date = (data['created'] as Timestamp).toDate();
    print(date);

    final Note noteToAdd = Note(
        courseCode: data['course_code'],
        coursePrefix: CoursePrefix.fromJson((coursePrefix.data() as Map<String, dynamic>)),
        documents: photos,
        created: date,
        explanation: data['explanation'],
        numberOfNotes: (data['documents'] as List<dynamic>).length,
        title: data['title'],
        user: User.fromJson((sharedBy.data() as Map<String, dynamic>)),
        universityId: (note.data()['university_id'] as DocumentReference).id);
    _toBeReturned.add(noteToAdd);
  }
  return _toBeReturned;
}
