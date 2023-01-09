import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Text(
          'hi',
          style: TextStyle(color: Colors.white),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Update'),
        ),
      ],
    ));
  }
}
