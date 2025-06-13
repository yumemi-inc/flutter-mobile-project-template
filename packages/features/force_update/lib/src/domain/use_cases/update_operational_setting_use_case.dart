class UpdateOperationalSettingUseCase {
  final OperationalSettingsRepository operationalSettingsRepository;

  UpdateOperationalSettingUseCase({
    required this.operationalSettingsRepository,
  });

  Future<void> call(OperationalSettings operationalSettings) async {
    await operationalSettingsRepository.updateOperationalSettings(
      operationalSettings,
    );
  }
}
