import 'package:flutter/material.dart';

import '../test_app.dart';

void main() {
  final listTiles = <Widget>[
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
  goldenTestsGroup(
    componentName: 'ListTile',
    testScenarios: [
      TestScenario(
        child: ListView(
          children: [
            ...listTiles,
            ...listTiles,
            ...listTiles,
            ...listTiles,
          ],
        ),
      ),
      TestScenario(
        name: 'Separated',
        child: ListView.separated(
          itemCount: listTiles.length * 4,
          itemBuilder: (context, index) => listTiles[index % listTiles.length],
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    ],
  );
}
