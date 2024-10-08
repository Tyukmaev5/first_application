import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhymer/features/history/bloc/history_rhymes_bloc.dart';
import 'package:rhymer/features/search/bloc/rhymes_list_bloc.dart';
import 'package:rhymer/features/search/widgets/rhymes_list_initial_banner.dart';
import 'package:rhymer/features/search/widgets/widgets.dart';
import 'package:rhymer/ui/ui.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true, // зафиксировать AppBar
          snap: true,
          floating: true,
          title: const Text('Rhymer'),
          centerTitle: true,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: SearchButton(
              controller: _searchController,
              onTap: () => _showSearchBottomSheet(context),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: BlocConsumer<HistoryRhymesBloc, HistoryRhymesState>(
            listener: _handleRhymesListState,
            builder: (context, state) {
              if (state is! HistoryRhymesLoaded) return const SizedBox();
              return SizedBox(
                height: 120,
                child: ListView.separated(
                  padding: const EdgeInsets.only(left: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.rhymes.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    final rhymes = state.rhymes[index];
                    return RhymeHistoryCard(
                      rhymes: rhymes.words,
                      word: rhymes.word,
                    );
                  },
                ),
              );
            },
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ), // разделитель
        BlocBuilder<RhymesListBloc, RhymesListState>(
          builder: (context, state) {
            if (state is RhymesListLoaded) {
              final rhymes = state.rhymes.words;
              return SliverList.builder(
                itemCount: rhymes.length,
                itemBuilder: (context, index) => RhymeListCard(
                  rhyme: rhymes[index],
                ),
              );
            }
            if (state is RhymesListInitial) {
              return const SliverFillRemaining(
                  child: RhymesListInitialBanner());
            }
            return const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ],
    );
  }

  void _handleRhymesListState(BuildContext context, HistoryRhymesState state) {
    if (state is RhymesListLoaded) {
      BlocProvider.of<HistoryRhymesBloc>(context).add(LoadHistoryRhymes());
    }
  }

  Future<void> _showSearchBottomSheet(BuildContext context) async {
    final bloc = BlocProvider.of<RhymesListBloc>(context);
    final query = await showModalBottomSheet<String>(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.only(top: 60),
        child: SearchRhymesBottomSheet(
          controller: _searchController,
        ),
      ),
    );
    if (query != null) {
      bloc.add(SearchRhymes(query: query));
    }
  }
}
