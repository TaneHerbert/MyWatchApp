import 'package:flutter/material.dart';
import 'package:mywatchapp/test.dart';
import 'face_gallery_information_class.dart';

class FaceGalleryInformation extends StatefulWidget {
  const FaceGalleryInformation({super.key, required this.test});

  final Todo test;

  @override
  State<FaceGalleryInformation> createState() => _FaceGalleryInformationState();
}

class _FaceGalleryInformationState extends State<FaceGalleryInformation> {
  bool _isExpandedDescription = false;
  bool _isExpandedSensors = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.test.title),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            testthis();
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 10, right: 20, bottom: 20),
                child: SizedBox(
                  height: 170,
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(widget.test.photo)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: const Color.fromARGB(255, 64, 64, 64),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Description',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isExpandedDescription = !_isExpandedDescription;
                            });
                          },
                          child: Text(
                            widget.test.description,
                            style: const TextStyle(color: Colors.grey),
                            textAlign: TextAlign.justify,
                            maxLines: _isExpandedDescription ? null : 5,
                            overflow: _isExpandedDescription
                                ? TextOverflow.clip
                                : TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: const Color.fromARGB(255, 64, 64, 64),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'What sensors are included?',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isExpandedSensors = !_isExpandedSensors;
                            });
                          },
                          child: Text(
                            widget.test.description,
                            style: const TextStyle(color: Colors.grey),
                            textAlign: TextAlign.justify,
                            maxLines: _isExpandedSensors ? null : 5,
                            overflow: _isExpandedSensors
                                ? TextOverflow.clip
                                : TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: const Color.fromARGB(255, 64, 64, 64),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: InkWell(
                  onTap: () {
                    testthis();
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(200, 34, 34, 34),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Set as current Watch Display",
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: InkWell(
                  onTap: () {
                    testthis();
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(200, 34, 34, 34),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Test Watch Display",
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
