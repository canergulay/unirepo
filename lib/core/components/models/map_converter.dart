abstract class MapConverter<T> {
  T fromJson(String documentId, Map<String, dynamic>? json);
  Map<String, dynamic> toJson();
}

abstract class SingleDocConverter<T> {
  T fromJson(Map<String, dynamic>? json);
  Map<String, dynamic> toJson();
}
