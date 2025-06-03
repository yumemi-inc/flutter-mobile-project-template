extension type VersionString(String value) {
  static final empty = VersionString('');

  /// Example: '1.0.9' -> [1, 0, 9]
  List<int> get versionList {
    final versionParts = value.split('.');

    if (versionParts.length != 3) {
      return [0, 0, 0];
    }

    try {
      return versionParts.map(int.parse).toList();
    } on FormatException catch (_) {
      return [0, 0, 0];
    }
  }

  bool operator >(VersionString other) {
    final selfVersionList = versionList;
    final otherVersionList = other.versionList;
    for (var i = 0; i < 3; ++i) {
      if (selfVersionList[i] > otherVersionList[i]) {
        return true;
      } else if (selfVersionList[i] < otherVersionList[i]) {
        return false;
      }
    }
    return false;
  }

  bool operator <(VersionString other) => other > this;

  bool operator >=(VersionString other) => this > other || this == other;

  bool operator <=(VersionString other) => this < other || this == other;
}
