import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'main.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({super.key, required this.device});
  // Recieve device information delivery
  final BluetoothDevice device;

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  // Flutter blue
  FlutterBlue flutterBlue = FlutterBlue.instance;

  // Connection status string
  String statetext = 'Connecting';

  // Connect button string
  String connectButtonText = 'Disconnect';

  // For saving the current connection state
  BluetoothDeviceState deviceState = BluetoothDeviceState.disconnected;

  // Connection status listener hande to release the lisener when the screen is closed
  StreamSubscription<BluetoothDeviceState>? _stateListener;

  @override
  void initState() {
    // Registering a state connection listener
    super.initState();
    _stateListener = widget.device.state.listen((event) {
      debugPrint('event : $event');
      if (deviceState == event) {
        // Ignore id state is equal
        return;
      }
      // Change connection state information
      setBleConnectionState(event);
    });
    // Start Connection
    connect();
  }

  @override
  void dispose() {
    // Clear status listener
    _stateListener?.cancel();
    // Disconnect
    disconnect();
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      // Update only when screen is mounted
      super.setState(fn);
    }
  }

  /* Connection status update */
  setBleConnectionState(BluetoothDeviceState event) {
    switch (event) {
      case BluetoothDeviceState.disconnected:
        statetext = 'Disconnected';
        // Change button state
        connectButtonText = 'Connect';
        break;
      case BluetoothDeviceState.disconnecting:
        statetext = 'Disconnecting';
        break;
      case BluetoothDeviceState.connected:
        statetext = 'Connected';
        // Change button state
        connectButtonText = 'Disconnect';
        break;
      case BluetoothDeviceState.connecting:
        statetext = 'Connecting';
        break;
    }
    // Save all state events
    deviceState = event;
    setState(() {});
  }

  // Start connection
  Future<bool> connect() async {
    Future<bool>? returnValue;
    setState(() {
      statetext = 'Connecting';
    });

    debugPrint('Test');

    /*
      Set timeout to 10 seconds (10000ms) and turn off autoconnect. For reference,
      if autoconnect is set to true the connection may be delayed.
    */
    await widget.device
        .connect(autoConnect: true)
        .timeout(const Duration(microseconds: 10000), onTimeout: () {
      // Time out occured
      // Set returnValue to false
      returnValue = Future.value(false);
      debugPrint('timeout failed');

      //Chnage the connection status to disconnected
      setBleConnectionState(BluetoothDeviceState.disconnected);
    }).then((data) {
      if (returnValue == null) {
        // If return value is null, the connection succeded because no timeout occured
        debugPrint('Connection successful');
        returnValue = Future.value(true);
      }
    });

    return returnValue ?? Future.value(false);
  }

  //Disconnect
  void disconnect() {
    try {
      setState(() {
        statetext = 'Disconnecting';
      });
      widget.device.disconnect();
      // ignore: empty_catches
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Connect Or Disconnect'),
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Connection status
              Text(
                statetext,
                style: const TextStyle(color: Colors.white),
              ),
              // Connect and disconnect button
              OutlinedButton(
                onPressed: () {
                  if (deviceState == BluetoothDeviceState.connected) {
                    // Disconnect if connected
                    disconnect();
                  } else if (deviceState == BluetoothDeviceState.disconnected) {
                    // Connect if disconnected
                    connect();
                  } else {}
                },
                child: Text(connectButtonText),
              ),
              TextButton(
                onPressed: () async {
                  List<BluetoothService> bleServices =
                      await widget.device.discoverServices();
                  for (BluetoothService service in bleServices) {
                    for (BluetoothCharacteristic c in service.characteristics) {
                      c.write(utf8.encode('L'));
                      debugPrint('Test');
                    }
                  }
                  // List<BluetoothService> services =
                  //     await widget.device.discoverServices();
                  // services.forEach((service) async {
                  //   var test = service.characteristics;
                  //   for (BluetoothCharacteristic c in test) {
                  //     await c.write(utf8.encode('L'));
                  //   }
                  // });
                },
                child: const Text("ON"),
              ),
              TextButton(
                onPressed: () async {
                  List<BluetoothService> bleServices =
                      await widget.device.discoverServices();
                  for (BluetoothService service in bleServices) {
                    for (BluetoothCharacteristic c in service.characteristics) {
                      int chunkSize = 20;

                      String message =
                          'This is a large amout of data that will be sent using data fragmentation lol hi there 123';

                      int messageLength = message.length;
                      int numFragments =
                          (messageLength / chunkSize.toDouble()).ceil();

                      for (int i = 0; i < numFragments; i++) {
                        int start = i * chunkSize;
                        int end = min(start + chunkSize, messageLength);

                        String fragment = message.substring(start, end);
                        c.write(utf8.encode(fragment));
                      }
                    }
                  }
                },
                child: const Text("OFF"),
              ),
              TextButton(
                onPressed: () async {
                  List<BluetoothService> services =
                      await widget.device.discoverServices();

                  var test = services[1].characteristics;
                  for (int i = 0; i < test.length; i++) {
                    List<int> value = await test[i].read();
                    print(String.fromCharCodes(value));
                  }
                },
                child: const Text('Pressed'),
              ),
            ],
          ),
        ));
  }
}
