import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rhymer/features/search/widgets/widgets.dart';
import 'package:rhymer/ui/ui.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true, // зафиксировать AppBar
          snap: true,
          floating: true,
          title: const Text('Rhymer'),
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(70),
              child: SearchButton(
                onTap: () {
                  showBottomSheet(
                    context: context,
                    builder: (context) => const Padding( 
                      padding: EdgeInsets.all(20),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text('showBottomSheet'),
                      ),
                    ),
                  );
                },
              )),
        ),
        const SliverToBoxAdapter(
            child: SizedBox(
          height: 16,
        )),
        SliverToBoxAdapter(
            child: SizedBox(
                height: 120,
                child: ListView.separated(
                    padding: const EdgeInsets.only(left: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 16,
                        ),
                    itemBuilder: (context, index) {
                      return const RhymeHistoryCard(
                        rhymes: [
                          'word',
                          'word2',
                          'word3',
                          'word4',
                        ],
                      );
                    }))),
        const SliverToBoxAdapter(
            child: SizedBox(
          height: 16,
        )), // разделитель
        SliverList.builder(
            itemBuilder: (context, index) => const RhymeListCard(
                  rhyme: 'Рифма',
                )),
      ],
    );
  }
}
