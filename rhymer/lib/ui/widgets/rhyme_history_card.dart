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
              rhymes.asMap().entries.map((e) {
                final sb = StringBuffer();
                sb.write(e.value);
                if (e.key != rhymes.length - 1) {
                  sb.write(', ');
                }
                return sb.toString();
              }).join(),
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 13,
                color: theme.hintColor.withOpacity(0.4),
              ),
              maxLines: 4,
            ),
          )
        ],
      ),
    );
  }
}
