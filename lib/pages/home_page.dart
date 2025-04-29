import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Counter Page'),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('counter');
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Theme Page'),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('theme-change');
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Like Page'),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('likes');
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('TODO Page'),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('todo');
              },
            ),
          ],
        ),
      ),
    );
  }
}
