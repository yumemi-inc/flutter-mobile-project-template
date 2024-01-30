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
    return AppWebView(
      initialUrl: _initialUrl,
      pop: _pop,
    );
  }
}

class AppWebView extends StatefulWidget {
  const AppWebView({
    required String initialUrl,
    required void Function() pop,
    super.key,
  })  : _pop = pop,
        _initialUrl = initialUrl;

  final String _initialUrl;
  final VoidCallback _pop;

  @override
  State<AppWebView> createState() => _AppWebViewState();
}

class _AppWebViewState extends State<AppWebView> {
  InAppWebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) async {
        if (await _webViewController?.canGoBack() ?? false) {
          await _webViewController?.goBack();
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
