import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebView extends StatelessWidget {
  const WebView({
    required String initialUrl,
    required void Function() pop,
    super.key,
  })  : _pop = pop,
        _initialUrl = initialUrl;

  final String _initialUrl;
  final VoidCallback _pop;

  @override
  Widget build(BuildContext context) {
    InAppWebViewController? webViewController;
    return PopScope(
      canPop: false,
      onPopInvoked: (_) async {
        if (await webViewController?.canGoBack() ?? false) {
          await webViewController?.goBack();
        } else {
          _pop();
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
          initialUrlRequest: URLRequest(url: WebUri(_initialUrl)),
        ),
      ),
    );
  }
}
