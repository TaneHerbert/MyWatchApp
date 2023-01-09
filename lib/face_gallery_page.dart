import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mywatchapp/faceGalleryInformation.dart';
import 'faceGalleryInformationClass.dart';

class FaceGalleryPage extends StatelessWidget {
  const FaceGalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Todo> faceGalleryList = [
      const Todo('Test 1', 'Description 1', 'images/Unknown.jpeg'),
      const Todo('Test 2', 'Description 2', 'images/mainphoto.png'),
      const Todo('Test 3', 'Description 3', 'images/mainphoto.png'),
      const Todo('Test 4', 'Description 4', 'images/mainphoto.png'),
      const Todo('Test 5', 'Description 5', 'images/mainphoto.png'),
      const Todo('Test 6', 'Description 6', 'images/mainphoto.png'),
      const Todo('Test 7', 'Description 7', 'images/mainphoto.png'),
      const Todo('Test 8', 'Description 8', 'images/mainphoto.png'),
      const Todo('Test 9', 'Description 9', 'images/mainphoto.png'),
      const Todo('Test 10', 'Description 10', 'images/mainphoto.png'),
      const Todo('Test 11', 'Description 11', 'images/mainphoto.png'),
      const Todo('Test 12', 'Description 12', 'images/mainphoto.png'),
      const Todo('Test 13', 'Description 13', 'images/mainphoto.png'),
      const Todo('Test 14', 'Description 14', 'images/mainphoto.png'),
      const Todo('Test 15', 'Description 15', 'images/mainphoto.png'),
      const Todo('Test 16', 'Description 16', 'images/mainphoto.png'),
      const Todo('Test 17', 'Description 17', 'images/mainphoto.png'),
      const Todo('Test 18', 'Description 18', 'images/mainphoto.png'),
      const Todo('Test 19', 'Description 19', 'images/mainphoto.png'),
      const Todo('Test 20', 'Description 20', 'images/mainphoto.png'),
      const Todo('Test 21', 'Description 21', 'images/mainphoto.png'),
      const Todo('Test 22', 'Description 22', 'images/mainphoto.png'),
      const Todo('Test 23', 'Description 23', 'images/mainphoto.png'),
      const Todo('Test 24', 'Description 24', 'images/mainphoto.png'),
      const Todo('Test 25', 'Description 25', 'images/mainphoto.png'),
    ];
    return Scaffold(
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 100.0,
              enableInfiniteScroll: true,
              viewportFraction: 0.4,
              reverse: false,
              initialPage: 0,
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return FaceGalleryInformation(
                              test: faceGalleryList[i - 1],
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(color: Colors.amber),
                      child: Image.asset('images/mainphoto.png'),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const Spacer(
            flex: 1,
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 100.0,
              enableInfiniteScroll: true,
              viewportFraction: 0.4,
              reverse: false,
              initialPage: 0,
            ),
            items: [6, 7, 8, 9, 10].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return FaceGalleryInformation(
                              test: faceGalleryList[i - 1],
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(color: Colors.amber),
                        child: Text(
                          'text $i',
                          style: const TextStyle(fontSize: 16.0),
                        )),
                  );
                },
              );
            }).toList(),
          ),
          const Spacer(
            flex: 1,
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 100.0,
              enableInfiniteScroll: true,
              viewportFraction: 0.4,
              reverse: false,
              initialPage: 0,
            ),
            items: [11, 12, 13, 14, 15].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return FaceGalleryInformation(
                              test: faceGalleryList[i - 1],
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(color: Colors.amber),
                        child: Text(
                          'text $i',
                          style: const TextStyle(fontSize: 16.0),
                        )),
                  );
                },
              );
            }).toList(),
          ),
          const Spacer(
            flex: 1,
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 100.0,
              enableInfiniteScroll: true,
              viewportFraction: 0.4,
              reverse: false,
              initialPage: 0,
            ),
            items: [16, 17, 18, 19, 20].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return FaceGalleryInformation(
                              test: faceGalleryList[i - 1],
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(color: Colors.amber),
                        child: Text(
                          'text $i',
                          style: const TextStyle(fontSize: 16.0),
                        )),
                  );
                },
              );
            }).toList(),
          ),
          const Spacer(
            flex: 1,
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 100.0,
              enableInfiniteScroll: true,
              viewportFraction: 0.4,
              reverse: false,
              initialPage: 0,
            ),
            items: [21, 22, 23, 24, 25].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return FaceGalleryInformation(
                              test: faceGalleryList[i - 1],
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(color: Colors.amber),
                        child: Text(
                          'text $i',
                          style: const TextStyle(fontSize: 16.0),
                        )),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
