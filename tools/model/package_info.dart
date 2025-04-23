final class PackageInfo implements Comparable<PackageInfo> {
  const PackageInfo({
    required this.name,
    required this.version,
  });

  final String name;
  final String version;

  @override
  int compareTo(PackageInfo other) {
    final nameComparison = name.compareTo(other.name);
    if (nameComparison != 0) return nameComparison;

    return version.compareTo(other.version);
  }

  @override
  bool operator ==(Object other) =>
      other is PackageInfo && other.name == name && other.version == version;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'version': version,
    };
  }
}
