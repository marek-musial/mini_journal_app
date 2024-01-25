import 'package:flutter/material.dart';

class MoodPage extends StatelessWidget {
  const MoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal home page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'My mood today:',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OverflowBar(
                  spacing: 8,
                  overflowSpacing: 4,
                  overflowAlignment: OverflowBarAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Good'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Neutral'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Bad'),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
