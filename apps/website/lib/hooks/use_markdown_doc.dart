import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:website/utils/doc_key.dart';

String? useMarkdownDoc(String? docKey) {
  final doc = useState<String?>(null);

  useEffect(
    () {
      if (docKey != null) {
        Future.microtask(() async {
          doc.value = await rootBundle.loadString(toAssetKey(docKey));
        });
      }

      return;
    },
    [docKey],
  );

  return doc.value;
}
