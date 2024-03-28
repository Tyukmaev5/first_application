import 'package:flutter/material.dart';
import 'package:rhymer/ui/widgets/widgets.dart';   

class RhymeHistoryCard extends StatelessWidget {
  const RhymeHistoryCard({
    super.key,
    required this.rhymes,
  });

  final List<String> rhymes;

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
          Text(
            'Слова',
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          Flexible(
            child: Text(
              rhymes.map((e) => '$e, ').join(),
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              // Wrap(
              //   children: rhymes
              //       .map((e) => Padding(
              //             padding: const EdgeInsets.only(right: 4),
              //             child: Text(e),
              //           ))
              //       .toList(),
            ),
          )
        ],
      ),
    );
  }
}
