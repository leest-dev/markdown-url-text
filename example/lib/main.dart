import 'package:flutter/material.dart';
import 'package:markdown_url_text/markdown_url_text.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DemoPage(),
    );
  }
}

class DemoPage extends StatelessWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: MarkdownUrlText(
        'Learn more [link](https://leest.dev)',
        style: TextStyle(fontSize: 24),
        linkStyle: TextStyle(color: Colors.blue),
      ),
    );
  }
}
