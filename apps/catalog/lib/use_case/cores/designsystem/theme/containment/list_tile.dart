import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// ListTile
/// https://api.flutter.dev/flutter/material/ListTile-class.html

final List<Widget> _listTiles = [
  ListTile(
    leading: const CircleAvatar(child: Text('A')),
    title: const Text('Headline'),
    subtitle: const Text('Supporting text'),
    trailing: const Icon(Icons.favorite_rounded),
    onTap: () {},
  ),
  ListTile(
    leading: const CircleAvatar(child: Text('B')),
    title: const Text('Headline'),
    subtitle: const Text(
      //
      // ignore: lines_longer_than_80_chars
      'Longer supporting text to demonstrate how the text wraps and how the leading and trailing widgets are centered vertically with the text.',
    ),
    trailing: const Icon(Icons.favorite_rounded),
    onTap: () {},
  ),
  ListTile(
    leading: const CircleAvatar(child: Text('C')),
    title: const Text('Headline'),
    subtitle: const Text(
      //
      // ignore: lines_longer_than_80_chars
      "Longer supporting text to demonstrate how the text wraps and how setting 'ListTile.isThreeLine = true' aligns leading and trailing widgets to the top vertically with the text.",
    ),
    trailing: const Icon(Icons.favorite_rounded),
    isThreeLine: true,
    onTap: () {},
  ),
];

@UseCase(
  name: 'Default',
  type: ListTile,
  path: '[Theme Preview]/Containment',
)
Widget defaultListTile(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('ListTile Sample')),
      body: ListView(
        children: [
          ..._listTiles,
          ..._listTiles,
          ..._listTiles,
          ..._listTiles,
        ],
      ),
    );

@UseCase(
  name: 'Divider',
  type: ListTile,
  path: '[Theme Preview]/Containment',
)
Widget separatedListTile(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('Separated ListTile Sample')),
      body: ListView.separated(
        itemCount: _listTiles.length * 4,
        itemBuilder: (context, index) => _listTiles[index % _listTiles.length],
        separatorBuilder: (context, index) => const Divider(
          height: 1,
        ),
      ),
    );
