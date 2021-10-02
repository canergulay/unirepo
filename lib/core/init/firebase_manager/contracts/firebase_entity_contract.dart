abstract class IFirebaseEntity<T> {
  final String collectionName;
  Future<List<T>> desiredReturn();
  IFirebaseEntity(this.collectionName);
}
