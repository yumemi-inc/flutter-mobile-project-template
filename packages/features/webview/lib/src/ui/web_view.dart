import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebView extends StatelessWidget {
  const WebView({
    required this.initialUrl,
    required this.pop,
    super.key,
  });

  final String initialUrl;
  final VoidCallback pop;

  @override
  Widget build(BuildContext context) {
    InAppWebViewController? webViewController;
    return PopScope(
      canPop: false,
      onPopInvoked: (_) async {
        if (await webViewController?.canGoBack() ?? false) {
          await webViewController?.goBack();
        } else {
          pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WebView'),
        ),
        body: InAppWebView(
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
          initialUrlRequest: URLRequest(url: WebUri(initialUrl)),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('initialUrl', initialUrl));
    properties.add(ObjectFlagProperty<VoidCallback>.has('pop', pop));
  }
}
