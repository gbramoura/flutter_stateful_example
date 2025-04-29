import 'package:flutter/material.dart';
import 'package:flutter_stateful_example/pages/home_page.dart';
import 'package:flutter_stateful_example/pages/like_page.dart';
import 'package:flutter_stateful_example/pages/theme_page.dart';
import 'package:flutter_stateful_example/pages/todo_page.dart';
import 'package:flutter_stateful_example/provider/theme_provider.dart';
import 'package:flutter_stateful_example/pages/counter_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'stateful Example App',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: HomePage(),
      routes: {
        'counter': (context) => CounterPage(),
        'theme-change': (context) => ThemePage(),
        'likes': (context) => LikePage(),
        'todo': (context) => TodoPage(),
      },
    );
  }
}
