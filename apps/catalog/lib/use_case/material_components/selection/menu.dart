import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// Menu
/// https://api.flutter.dev/flutter/material/MenuAnchor-class.html

@UseCase(
  name: 'Menu',
  type: MenuAnchor,
  path: '[Theme Preview]/Selection',
)
Widget menu(BuildContext context) {
  final buttonFocusNode = FocusNode(debugLabel: 'Menu Button');

  return Scaffold(
    appBar: AppBar(
      title: const Text('MenuAnchor Simple Example'),
      actions: <Widget>[
        MenuAnchor(
          menuChildren: [
            MenuItemButton(
              onPressed: () {},
              child: const Text('Revert'),
            ),
            MenuItemButton(
              onPressed: () {},
              child: const Text('Setting'),
            ),
            MenuItemButton(
              onPressed: () {},
              child: const Text('Send Feedback'),
            ),
          ],
          builder: (_, controller, child) {
            return IconButton(
              focusNode: buttonFocusNode,
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              icon: const Icon(Icons.more_vert),
            );
          },
        ),
      ],
    ),
  );
}
