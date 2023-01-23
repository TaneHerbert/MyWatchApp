import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter/cupertino.dart';

import 'package:mywatchapp/discover_page.dart';
import 'package:mywatchapp/home_page.dart';
import 'package:mywatchapp/settings_page.dart';
import 'package:mywatchapp/test.dart';

void main() {
  initializeApp();
  runApp(const MyApp());
}

void initializeApp() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
  List<Widget> pages = [const HomePage(), const DiscoverPage()];
  List<String> title = ['', 'Discover'];

  @override
  void initState() {
    test(checkForConnectedDevices);
    super.initState();
  }

  // This shows a CupertinoModalPopup which hosts a CupertinoAlertDialog.
  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Lost Connection'),
        content:
            const Text('Lost connection with Watch. Please connect again.'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            /// This parameter indicates this action is the default,
            /// and turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  void checkForConnectedDevices() {
    FlutterBlue flutterBlue = FlutterBlue.instance;
    flutterBlue.connectedDevices.then((bondedDevices) {
      if (bondedDevices.isEmpty) {
        setState(() {
          pages = [const HomePage(), const DiscoverPage()];
          title = ['', 'Discover'];
        });

        Navigator.of(context).popUntil((route) => route.isFirst);
        _showAlertDialog(context);

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
    });
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
            if (title[0] != "") {
              checkForConnectedDevices();
            }
            currentPage = index;
          });
        },
        currentIndex: currentPage,
      ),
    );
  }
}
