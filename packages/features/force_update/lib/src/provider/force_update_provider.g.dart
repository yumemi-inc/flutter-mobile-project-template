// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore, deprecated_member_use

part of 'force_update_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$operationalSettingRepositoryHash() =>
    r'888e721b5ce2ca4e59362054bd5946f6bfae7120';

/// See also [operationalSettingRepository].
@ProviderFor(operationalSettingRepository)
final operationalSettingRepositoryProvider =
    AutoDisposeProvider<OperationalSettingRepository>.internal(
      operationalSettingRepository,
      name: r'operationalSettingRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$operationalSettingRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OperationalSettingRepositoryRef =
    AutoDisposeProviderRef<OperationalSettingRepository>;
String _$checkForceUpdateUseCaseHash() =>
    r'fe4d4889fd338cb807176a7992bb06c8da12b30d';

/// See also [checkForceUpdateUseCase].
@ProviderFor(checkForceUpdateUseCase)
final checkForceUpdateUseCaseProvider =
    AutoDisposeProvider<CheckForceUpdateUseCase>.internal(
      checkForceUpdateUseCase,
      name: r'checkForceUpdateUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$checkForceUpdateUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CheckForceUpdateUseCaseRef =
    AutoDisposeProviderRef<CheckForceUpdateUseCase>;
String _$forceUpdateHash() => r'd02dad5032e1a6c36cd4dce7dc4ec944ff7c0321';

/// See also [ForceUpdate].
@ProviderFor(ForceUpdate)
final forceUpdateProvider =
    AsyncNotifierProvider<ForceUpdate, ForceUpdateSettingsState>.internal(
      ForceUpdate.new,
      name: r'forceUpdateProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$forceUpdateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ForceUpdate = AsyncNotifier<ForceUpdateSettingsState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
