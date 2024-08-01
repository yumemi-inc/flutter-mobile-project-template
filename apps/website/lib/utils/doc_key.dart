const _prefix = 'assets/docs/';

String toDocKey(String assetKey) {
  return assetKey.substring(_prefix.length);
}

String toAssetKey(String docKey) {
  return '$_prefix$docKey';
}
