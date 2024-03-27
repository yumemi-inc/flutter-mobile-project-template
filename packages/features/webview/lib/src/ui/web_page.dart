import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebPage extends StatefulHookWidget {
  const WebPage({
    required Uri initialUrl,
    required VoidCallback pop,
    super.key,
  })  : _pop = pop,
        _initialUrl = initialUrl;

  final Uri _initialUrl;
  final VoidCallback _pop;

  @override
  State<WebPage> createState() => _WebViewState();
}

class _WebViewState extends State<WebPage> {
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
  void dispose() {
    super.dispose();
    _webViewController?.dispose();
    // The `_pullToRefreshController` is internally executing a dispose
    // operation once, therefore, `dispose()` is not called here.
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);
    final canPop = useState(false);
    final hasError = useState(false);
    return PopScope(
      canPop: canPop.value,
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
        body: Stack(
          children: [
            Visibility(
              visible: !hasError.value,
              child: InAppWebView(
                onWebViewCreated: (controller) {
                  _webViewController = controller;
                },
                initialUrlRequest: URLRequest(
                  url: WebUri.uri(widget._initialUrl),
                ),
                key: _webViewKey,
                pullToRefreshController: _pullToRefreshController,
                onLoadStart: (_, __) async {
                  isLoading.value = true;
                },
                initialSettings: InAppWebViewSettings(
                  cacheMode: CacheMode.LOAD_NO_CACHE,
                ),
                onProgressChanged: (_, progress) async {
                  if (progress == 100) {
                    isLoading.value = false;
                    await _pullToRefreshController?.endRefreshing();
                  }
                  if (await _webViewController!.canGoBack()) {
                    canPop.value = false;
                  } else {
                    canPop.value = true;
                  }
                },
                onLoadStop: (_, __) async {
                  await _pullToRefreshController?.endRefreshing();
                  isLoading.value = false;
                },
                onReceivedError: (controller, request, error) async {
                  if (isLoading.value) {
                    await _pullToRefreshController?.endRefreshing();
                    isLoading.value = false;
                  }
                  if (request.isForMainFrame ?? true) {
                    hasError.value = true;
                  }
                },
              ),
            ),
            if (hasError.value)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('エラーが発生しました'),
                    TextButton(
                      onPressed: () async {
                        hasError.value = false;
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
              ),
          ],
        ),
      ),
    );
  }
}
