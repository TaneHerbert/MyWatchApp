import 'package:flutter/material.dart';
import 'faceGalleryInformationClass.dart';

class FaceGalleryInformation extends StatelessWidget {
  const FaceGalleryInformation({super.key, required this.test});

  final Todo test;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Face Gallery Information'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('Actions');
            },
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: Column(
        children: [
          Text(
            test.title,
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            test.description,
            style: const TextStyle(color: Colors.white),
          ),
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(color: Colors.amber),
            child: Image.asset(test.photo),
          ),
        ],
      ),
    );
  }
}
