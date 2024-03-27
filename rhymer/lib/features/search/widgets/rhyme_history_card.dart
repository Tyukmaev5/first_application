import 'package:flutter/material.dart';
import 'package:rhymer/ui/ui.dart';

class RhymeHistoryCard extends StatelessWidget {
  const RhymeHistoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final rhymes = List.generate(4, (index) => 'Word $index');
    final theme = Theme.of(context);
    return BaseContainer(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(12),
      width: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Phrase',
              style: theme.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w700)),
          Wrap(
            spacing: 8,
            children: [...rhymes.map((rhyme) => Text(rhyme))],
          )
        ],
      ),
    );
  }
}
