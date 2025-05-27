/// Infrastructure layer package for data access
/// and external service integration.
///
/// This package contains:
/// - Repository implementations
/// - API clients
/// - Data storage services
library;

export 'src/internal_infrastructure_base.dart';
export 'src/shared_preferences/shared_preference_data_source.dart';
export 'src/shared_preferences/shared_preferences_keys.dart';
export 'src/theme_mode/theme_mode_repository_impl.dart';

// TODO: Export any libraries intended for clients of this package.
