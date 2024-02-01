import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebView extends StatefulHookWidget {
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
  final GlobalKey _webViewKey = GlobalKey();
  PullToRefreshController? _pullToRefreshController;
  InAppWebViewController? _webViewController;

  @override
  void initState() {
    super.initState();
    _pullToRefreshController = PullToRefreshController(
      settings: PullToRefreshSettings(color: Colors.blue),
      onRefresh: onRefresh,
    );
  }

  Future<void> onRefresh() async {
    if (Platform.isAndroid) {
      await _webViewController?.reload();
    } else if (Platform.isIOS) {
      await _webViewController?.loadUrl(
        urlRequest: URLRequest(
          url: await _webViewController?.getUrl(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);
    final hasError = useState(false);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (hasError.value) {
          widget._pop();
        }
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
        body: Stack(
          children: [
            if (!hasError.value)
              InAppWebView(
                onWebViewCreated: (controller) {
                  _webViewController = controller;
                },
                initialUrlRequest: URLRequest(url: WebUri(widget._initialUrl)),
                key: _webViewKey,
                pullToRefreshController: _pullToRefreshController,
                onLoadStart: (_, __) async {
                  hasError.value = false;
                  isLoading.value = true;
                },
                onLoadStop: (_, __) async {
                  await _pullToRefreshController?.endRefreshing();
                  hasError.value = false;
                  isLoading.value = false;
                },
                onReceivedError: (controller, request, error) async {
                  if (error.type == WebResourceErrorType.UNKNOWN ||
                      error.type == WebResourceErrorType.CANCELLED) {
                    return;
                  }
                  await _pullToRefreshController?.endRefreshing();
                  isLoading.value = false;
                  hasError.value = true;
                },
              )
            else
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('エラーが発生しました'),
                    TextButton(
                      onPressed: () async {
                        await onRefresh();
                      },
                      child: const Text('再読み込み'),
                    ),
                  ],
                ),
              ),
            if (isLoading.value)
              const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            else
              const SizedBox(),
          ],
        ),
      ),
    );
  }
}