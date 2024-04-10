// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listOrganizationRepositoriesHash() =>
    r'4d079842bc0b74eb9241d5bb747bbdce174f8487';

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
  }) {
    return ListOrganizationRepositoriesProvider(
      page: page,
      perPage: perPage,
    );
  }

  @override
  ListOrganizationRepositoriesProvider getProviderOverride(
    covariant ListOrganizationRepositoriesProvider provider,
  ) {
    return call(
      page: provider.page,
      perPage: provider.perPage,
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
  }) : this._internal(
          (ref) => listOrganizationRepositories(
            ref as ListOrganizationRepositoriesRef,
            page: page,
            perPage: perPage,
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
  }) : super.internal();

  final int page;
  final int perPage;

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
        other.perPage == perPage;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, perPage.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListOrganizationRepositoriesRef
    on AutoDisposeFutureProviderRef<GitHubRepositoryResult> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `perPage` of this provider.
  int get perPage;
}

class _ListOrganizationRepositoriesProviderElement
    extends AutoDisposeFutureProviderElement<GitHubRepositoryResult>
    with ListOrganizationRepositoriesRef {
  _ListOrganizationRepositoriesProviderElement(super.provider);

  @override
  int get page => (origin as ListOrganizationRepositoriesProvider).page;
  @override
  int get perPage => (origin as ListOrganizationRepositoriesProvider).perPage;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
