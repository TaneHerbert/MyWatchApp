import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'package:mywatchapp/discover_page.dart';

import 'package:mywatchapp/home_page.dart';
import 'package:mywatchapp/settings_page.dart';
import 'package:mywatchapp/test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  List<String> title = ['', 'Discover'];

  @override
  void initState() {
    pages = [const HomePage(), const DiscoverPage()];
    test(runFunctionOnStartups);
    runFunctionOnStartups();
    super.initState();
  }

  void runFunctionOnStartups() async {
    FlutterBlue flutterBlue = FlutterBlue.instance;
    List<BluetoothDevice> bondedDevices = await flutterBlue.connectedDevices;

    if (bondedDevices.isEmpty) {
      setState(() {
        pages = [const HomePage(), const DiscoverPage()];
        title = ['', 'Discover'];
      });
      Navigator.of(context).popUntil((route) => route.isFirst);
      return;
    }

    for (BluetoothDevice device in bondedDevices) {
      if (device.name == "HMSoft") {
        setState(() {
          pages = [const SettingsPage(), const DiscoverPage()];
          title = ['My Watch', 'Discover'];
        });

        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          title[currentPage],
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
            icon: Icon(Icons.search),
            label: "Discover",
          )
        ],
        onTap: (int index) async {
          setState(() {
            runFunctionOnStartups();
            currentPage = index;
          });
        },
        currentIndex: currentPage,
      ),
    );
  }
}
