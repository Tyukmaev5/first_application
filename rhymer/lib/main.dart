import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFF82B10);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: const Color(0xFFEFF1F3),
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true, // зафиксировать AppBar
            snap: true,
            floating: true,
            title: Text('Rhymer'),
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(70), child: SearchButton()),
          ),
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 16,
          )),
          SliverToBoxAdapter(
              child: ListView.separated(
                  padding: const EdgeInsets.only(left: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    return const RhymeHistoryCard();
                  })),
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 16,
          )), // разделитель
          SliverList.builder(
            itemBuilder: (context, index) => const RhymeListCard(),
          ),
        ],
      ),
    );
  }
}

class RhymeHistoryCard extends StatelessWidget {
  const RhymeHistoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final rhymes = List.generate(4, (index) => 'Рифма #$index');
    final theme = Theme.of(context);
    return BaseContainer(
        margin: EdgeInsets.zero,
        padding: const EdgeInsets.all(12),
        width: 200,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text('Слово',
              style: theme.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w700)),
          Wrap(
            spacing: 8,
            children: [...rhymes.map((rhyme) => Text(rhyme))],
          )
        ]));
  }
}

class BaseContainer extends StatelessWidget {
  const BaseContainer({
    super.key,
    required this.child,
    required this.width,
    this.margin,
    this.padding = const EdgeInsets.only(left: 12),
  });

  final EdgeInsets? margin;
  final double width;
  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          color: theme.cardColor, borderRadius: BorderRadius.circular(10)),
    );
  }
}

class RhymeListCard extends StatelessWidget {
  const RhymeListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseContainer(
      margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 10),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Рифма',
            style: theme.textTheme.bodyLarge,
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color: theme.hintColor.withOpacity(0.2),
              ))
        ],
      ),
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        width: double.infinity, // заполнить всю ширину
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.hintColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const Icon(Icons.search_rounded),
            const SizedBox(width: 12),
            Text(
              'Поиск рифм...',
              style: TextStyle(
                fontSize: 18,
                color: theme.hintColor.withOpacity(0.5),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ));
  }
}
