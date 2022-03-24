import 'package:flutter/material.dart';

class ChooseTopicPage extends StatelessWidget {
  const ChooseTopicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            Text('What Brings you to Silent Moon?'),
          ],
        ),
      ),
    );
  }
}
