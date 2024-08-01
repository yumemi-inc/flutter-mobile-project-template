import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:website/utils/doc_key.dart';

List<String> useMarkdownDocKeys() {
  final docs = useState<List<String>>([]);

  useEffect(
    () {
      Future.microtask(() async {
        final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
        final markdowns = manifest
            .listAssets()
            .where((key) => key.endsWith('.md'))
            .map(toDocKey)
            .toList();

        docs.value = markdowns;
      });

      return;
    },
    [],
  );

  return docs.value;
}
