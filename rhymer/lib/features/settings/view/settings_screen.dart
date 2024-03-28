import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rhymer/ui/ui.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            snap: true,
            floating: true,
            title: Text('Настройки'),
            elevation: 0,
            surfaceTintColor: Colors.transparent,
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16)), // раздел
          SliverToBoxAdapter(
            child: SettingsListCard(title: 'Темная тема', value: true),
          ),
        ],
      ),
    );
  }
}

class SettingsListCard extends StatelessWidget {
  const SettingsListCard({
    super.key,
    required this.title,
    required this.value,
    this.onChanged,
  });

  final String title;
  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BaseContainer(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium,
            ),
            CupertinoSwitch(
              value: value,
              onChanged: onChanged,
            )
          ],
        ),
      ),
    );
  }
}
