import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'package:mywatchapp/discover_page.dart';
import 'package:mywatchapp/face_gallery_page.dart';
import 'package:mywatchapp/home_page.dart';
import 'package:mywatchapp/settingsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = [];
  List<String> titles = [
    '',
    'Face Gallery',
    'Discover',
  ];

  @override
  void initState() {
    super.initState();

    // Run this function when the app is loaded up
    runFunctionOnStartup();
  }

  void runFunctionOnStartup() async {
    FlutterBlue flutterBlue = FlutterBlue.instance;
    List<BluetoothDevice> bondedDevices = await flutterBlue.connectedDevices;

    if (bondedDevices.isEmpty) {
      pages = const [HomePage(), FaceGalleryPage(), DiscoverPage()];
      titles[0] = '';
    }

    for (BluetoothDevice device in bondedDevices) {
      if (device.name == "Tane") {
        setState(() {
          pages = const [SettingsPage(), FaceGalleryPage(), DiscoverPage()];
          titles[0] = 'My Watch';
        });
      } else {
        setState(() {
          pages = const [HomePage(), FaceGalleryPage(), DiscoverPage()];
          titles[0] = '';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          titles[currentPage],
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        titleSpacing: 20,
      ),
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.orange,
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.watch),
            label: "My Watch",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Face Gallery",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Discover",
          )
        ],
        onTap: (int index) async {
          if (index == 0) {
            runFunctionOnStartup();
          }

          setState(() {
            currentPage = index;
          });
        },
        currentIndex: currentPage,
      ),
    );
  }
}
