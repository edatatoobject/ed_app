
//For future
class CahceManager {
  final Map<String, Map<String, Map<String, dynamic>>> cache = {};

  Map<String, Map<String, dynamic>> getAll(String collection) {
    return cache[collection];
  }

  Map<String, dynamic> getById(String collection, String id) {
    return cache[collection][id];
  }

  Map<String, Map<String, dynamic>> getByIds(
      String collection, List<String> ids) {
    return Map.from(cache)..removeWhere((key, value) => !ids.contains(key));
  }
}
