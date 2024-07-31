part of 'package:website/router/router.dart';

class MarkdownPageRoute extends GoRouteData {
  const MarkdownPageRoute({
    this.key,
  });

  static const path = '/';

  final String? key;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MarkdownPage(docKey: key);
  }
}
