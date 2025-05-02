import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebView',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: WebPage(
        initialUrl: Uri.parse('https://flutter.dev'),
      ),
    );
  }
}

class WebPage extends StatefulWidget {
  const WebPage({
    required Uri initialUrl,
    super.key,
  }) : _initialUrl = initialUrl;

  final Uri _initialUrl;

  @override
  State<WebPage> createState() => _WebViewState();
}

class _WebViewState extends State<WebPage> {
  final GlobalKey _webViewKey = GlobalKey();
  PullToRefreshController? _pullToRefreshController;
  InAppWebViewController? _webViewController;
  bool isLoading = false;
  bool canPop = false;
  bool hasError = false;

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
    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) {
          return;
        }
        final controller = _webViewController;
        if (controller == null) {
          return;
        }
        if (await controller.canGoBack()) {
          await controller.goBack();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WebView'),
        ),
        body: Stack(
          children: [
            Visibility(
              visible: !hasError,
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
                  setState(() {
                    isLoading = true;
                  });
                },
                initialSettings: InAppWebViewSettings(
                  cacheMode: CacheMode.LOAD_NO_CACHE,
                ),
                onProgressChanged: (_, progress) async {
                  if (progress == 100) {
                    setState(() {
                      isLoading = false;
                    });
                    await _pullToRefreshController?.endRefreshing();
                  }
                  final canGoBack = await _webViewController!.canGoBack();
                  setState(() {
                    canPop = canGoBack;
                  });
                },
                onLoadStop: (_, __) async {
                  await _pullToRefreshController?.endRefreshing();

                  setState(() {
                    isLoading = false;
                  });
                },
                onReceivedError: (controller, request, error) async {
                  if (isLoading) {
                    await _pullToRefreshController?.endRefreshing();

                    setState(() {
                      isLoading = false;
                    });
                  }
                  if (request.isForMainFrame ?? true) {
                    setState(() {
                      hasError = true;
                    });
                  }
                },
              ),
            ),
            if (hasError)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('エラーが発生しました'),
                    TextButton(
                      onPressed: () async {
                        setState(() {
                          hasError = false;
                        });
                        await onRefresh();
                      },
                      child: const Text('再読み込み'),
                    ),
                  ],
                ),
              ),
            if (isLoading)
              const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
          ],
        ),
      ),
    );
  }
}
