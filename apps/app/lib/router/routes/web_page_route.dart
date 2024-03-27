part of 'package:flutter_app/router/provider/router.dart';

@TypedGoRoute<WebPageRoute>(
  path: WebPageRoute.path,
)
class WebPageRoute extends GoRouteData {
  const WebPageRoute();

  static const path = '/web';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return WebPage(
      initialUrl: Uri.parse('https://flutter.dev'),
      pop: context.pop,
    );
  }
}
