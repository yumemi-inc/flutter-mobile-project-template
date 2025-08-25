import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// Radio
/// https://api.flutter.dev/flutter/material/Radio-class.html

@UseCase(
  name: 'Radio',
  type: Radio,
  path: '[Theme Preview]/Selection',
)
Widget radio(BuildContext context) {
  _SingingCharacter? character = _SingingCharacter.lafayette;

  return StatefulBuilder(
    builder: (context, setState) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: const Text('Lafayette'),
              leading: Radio<_SingingCharacter>(
                value: _SingingCharacter.lafayette,
                groupValue: character,
                onChanged: (value) {
                  setState(() {
                    character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Thomas Jefferson'),
              leading: Radio<_SingingCharacter>(
                value: _SingingCharacter.jefferson,
                groupValue: character,
                onChanged: (value) {
                  setState(() {
                    character = value;
                  });
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}

enum _SingingCharacter { lafayette, jefferson }
