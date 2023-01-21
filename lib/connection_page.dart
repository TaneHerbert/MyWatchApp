import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'package:mywatchapp/connect_to_device.dart';
import 'package:mywatchapp/test.dart';

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({super.key});

  @override
  State<ConnectionPage> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  List<ScanResult> scanResultList = [];
  bool _isScanning = false;

  @override
  void initState() {
    // Reset bluetooth
    super.initState();
    initBle();
  }

  void initBle() {
    // Ble listener to get scan status
    flutterBlue.isScanning.listen((isScanning) {
      _isScanning = isScanning;
      setState(() {});
    });
  }

  /* Scan start/stop function */
  scan() async {
    if (!_isScanning) {
      // If not scanning
      // Delete the previousl scanned list
      scanResultList.clear();
      // Start scanning. timeout 4 seconds
      flutterBlue.startScan(timeout: const Duration(seconds: 4));
      // Scan result listener
      flutterBlue.scanResults.listen((results) {
        // Copy he results value in the form of List<ScanResult> to scanResultList
        scanResultList = results;
        //UI update
        setState(() {});
      });
    } else {
      // Stop scanning if scanning
      flutterBlue.stopScan();
    }
  }

  /* Device Signal Value Widget */
  Widget deviceSignal(ScanResult r) {
    return Text(
      r.rssi.toString(),
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }

  /* Device MAC Address Widget */
  Widget deviceMacAddress(ScanResult r) {
    return Text(
      r.device.id.id,
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }

  /* Device Name Widget */
  Widget deviceName(ScanResult r) {
    String name = '';

    if (r.device.name.isNotEmpty) {
      // If device name has a value
      name = r.device.name;
    } else if (r.advertisementData.localName.isNotEmpty) {
      // If advertisementData.localName has a value
      name = r.advertisementData.localName;
    } else {
      // If dosen't have both then put N/A
      name = 'N/A';
    }
    return Text(
      name,
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }

  /* BLE Icon Widget */
  Widget leading(ScanResult r) {
    return const CircleAvatar(
      backgroundColor: Colors.cyan,
      child: Icon(
        Icons.bluetooth,
        color: Colors.white,
      ),
    );
  }

  /* Function called whe a device item is tapped */
  void onTap(ScanResult r) {
    // Print name of device
    debugPrint(r.device.name);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return ConnectPage(selectedDevice: r.device);
        },
      ),
    ).then((_) {
      // widget.test();
      testthis();
      Navigator.of(context).pop();
    });
  }

  /* Device item widget */
  Widget listItem(ScanResult r) {
    return ListTile(
      onTap: () => onTap(r),
      leading: leading(r),
      title: deviceName(r),
      subtitle: deviceMacAddress(r),
      trailing: deviceSignal(r),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connectection Page'),
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
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Center(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return listItem(scanResultList[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: Colors.white,
                );
              },
              itemCount: scanResultList.length),
        ),
      ),
      /* Search for devices or stop scanning */
      floatingActionButton: FloatingActionButton(
        onPressed: scan,
        child: Icon(_isScanning ? Icons.stop : Icons.search),
      ),
    );
  }
}
