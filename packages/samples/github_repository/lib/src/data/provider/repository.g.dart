// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore, deprecated_member_use

part of 'repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listOrganizationRepositoriesHash() =>
    r'e563eea8496b6e4cfd966f0ea714319e646cf3d1';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [listOrganizationRepositories].
@ProviderFor(listOrganizationRepositories)
const listOrganizationRepositoriesProvider =
    ListOrganizationRepositoriesFamily();

/// See also [listOrganizationRepositories].
class ListOrganizationRepositoriesFamily
    extends Family<AsyncValue<GitHubRepositoryResult>> {
  /// See also [listOrganizationRepositories].
  const ListOrganizationRepositoriesFamily();

  /// See also [listOrganizationRepositories].
  ListOrganizationRepositoriesProvider call({
    int page = 1,
    int perPage = 30,
    String org = 'yumemi-inc',
  }) {
    return ListOrganizationRepositoriesProvider(
      page: page,
      perPage: perPage,
      org: org,
    );
  }

  @override
  ListOrganizationRepositoriesProvider getProviderOverride(
    covariant ListOrganizationRepositoriesProvider provider,
  ) {
    return call(
      page: provider.page,
      perPage: provider.perPage,
      org: provider.org,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'listOrganizationRepositoriesProvider';
}

/// See also [listOrganizationRepositories].
class ListOrganizationRepositoriesProvider
    extends AutoDisposeFutureProvider<GitHubRepositoryResult> {
  /// See also [listOrganizationRepositories].
  ListOrganizationRepositoriesProvider({
    int page = 1,
    int perPage = 30,
    String org = 'yumemi-inc',
  }) : this._internal(
          (ref) => listOrganizationRepositories(
            ref as ListOrganizationRepositoriesRef,
            page: page,
            perPage: perPage,
            org: org,
          ),
          from: listOrganizationRepositoriesProvider,
          name: r'listOrganizationRepositoriesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listOrganizationRepositoriesHash,
          dependencies: ListOrganizationRepositoriesFamily._dependencies,
          allTransitiveDependencies:
              ListOrganizationRepositoriesFamily._allTransitiveDependencies,
          page: page,
          perPage: perPage,
          org: org,
        );

  ListOrganizationRepositoriesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.perPage,
    required this.org,
  }) : super.internal();

  final int page;
  final int perPage;
  final String org;

  @override
  Override overrideWith(
    FutureOr<GitHubRepositoryResult> Function(
            ListOrganizationRepositoriesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListOrganizationRepositoriesProvider._internal(
        (ref) => create(ref as ListOrganizationRepositoriesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        perPage: perPage,
        org: org,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GitHubRepositoryResult> createElement() {
    return _ListOrganizationRepositoriesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListOrganizationRepositoriesProvider &&
        other.page == page &&
        other.perPage == perPage &&
        other.org == org;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, perPage.hashCode);
    hash = _SystemHash.combine(hash, org.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ListOrganizationRepositoriesRef
    on AutoDisposeFutureProviderRef<GitHubRepositoryResult> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `perPage` of this provider.
  int get perPage;

  /// The parameter `org` of this provider.
  String get org;
}

class _ListOrganizationRepositoriesProviderElement
    extends AutoDisposeFutureProviderElement<GitHubRepositoryResult>
    with ListOrganizationRepositoriesRef {
  _ListOrganizationRepositoriesProviderElement(super.provider);

  @override
  int get page => (origin as ListOrganizationRepositoriesProvider).page;
  @override
  int get perPage => (origin as ListOrganizationRepositoriesProvider).perPage;
  @override
  String get org => (origin as ListOrganizationRepositoriesProvider).org;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
