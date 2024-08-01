import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:website/ui/default_layout.dart';
import 'package:website/ui/markdown_page.dart';

part 'package:website/router/routes/markdown_page_route.dart';
part 'package:website/router/routes/markdown_shell_route.dart';
part 'router.g.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: $appRoutes,
);
