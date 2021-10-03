abstract class FirestoreModel<T> {
  final String modelID;
  final T model;
  FirestoreModel({required this.model, required this.modelID});
}
