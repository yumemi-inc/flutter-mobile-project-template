import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebView extends StatefulWidget {
  const WebView({
    required String initialUrl,
    required VoidCallback pop,
    super.key,
  })  : _pop = pop,
        _initialUrl = initialUrl;

  final String _initialUrl;
  final VoidCallback _pop;

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  InAppWebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        final controller = _webViewController;
        if (controller == null) {
          return;
        }
        if (await controller.canGoBack()) {
          await controller.goBack();
        } else {
          widget._pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WebView'),
        ),
        body: InAppWebView(
          onWebViewCreated: (controller) {
            _webViewController = controller;
          },
          initialUrlRequest: URLRequest(url: WebUri(widget._initialUrl)),
        ),
      ),
    );
  }
}
