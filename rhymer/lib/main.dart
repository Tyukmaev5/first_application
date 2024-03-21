import 'package:flutter/material.dart';

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
      theme: ThemeData(
        primaryColor: primaryColor,
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
    final theme = Theme.of(context);
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              // pinned: true, // зафиксировать AppBar
              snap: true,
              floating: true,
              title: const Text('Rhymer'),
              backgroundColor: theme.primaryColor,
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(70),
                  child: TextFormField()),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: theme.primaryColor,
          onPressed: () {},
          child: const Icon(Icons.add),
        ));
  }
}
