import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_app.dart';

void main() {
  goldenTestsGroup(
    componentName: 'Menu',
    pumpWidget: (tester, widget) async {
      await tester.pumpWidget(widget);
      final button = find.byType(IconButton);
      button.evaluate();
      for (var i = 0; i < button.found.length; i++) {
        await tester.tap(button.at(i));
      }
      await tester.pumpAndSettle();
    },
    testScenarios: [
      TestScenario(
        child: Builder(
          builder: (context) {
            {
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
          },
        ),
      ),
    ],
  );
}
