import 'package:flutter/material.dart';
import 'package:flutter_stateful_example/provider/theme_provider.dart';
import 'package:flutter_stateful_example/theme/dart_theme.dart';
import 'package:flutter_stateful_example/theme/light_theme.dart';
import 'package:provider/provider.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({super.key});

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  void _setLightTheme() {
    var repo = Provider.of<ThemeProvider>(context, listen: false);
    repo.themeData = lightTheme;
  }

  void _setDarkTheme() {
    var repo = Provider.of<ThemeProvider>(context, listen: false);
    repo.themeData = darkTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Changer"),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _setLightTheme,
                  child: Icon(Icons.light_mode),
                ),
                SizedBox(width: 30),
                ElevatedButton(
                  onPressed: _setDarkTheme,
                  child: Icon(Icons.dark_mode),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
