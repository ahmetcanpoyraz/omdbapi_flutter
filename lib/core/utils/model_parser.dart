class ModelParser {
  List<T>? createListToResponse<T>(var value, Function fromResponse) {
    List<T>? result = [];
    if (value.isNotEmpty) {
      for (Map<String, dynamic> item in value) {
        result.add(fromResponse(item));
      }
      return result;
    } else {
      return [];
    }
  }
}
