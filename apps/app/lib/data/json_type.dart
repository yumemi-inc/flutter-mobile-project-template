typedef ListJson = List<dynamic>;
typedef MapJson = Map<String, dynamic>;

extension ListParsing on ListJson {
  List<T> parseList<T>(T Function(MapJson e) transform) {
    return map((e) => transform(e as MapJson)).toList();
  }
}
