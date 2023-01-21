import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class ConnectPage extends StatefulWidget {
  final BluetoothDevice selectedDevice;

  const ConnectPage({super.key, required this.selectedDevice});

  @override
  State<ConnectPage> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  bool _isConnecting = false;
  bool _showTick = false;

  @override
  void initState() {
    super.initState();
    _connectToDevice();
  }

  Future<void> _connectToDevice() async {
    setState(() {
      _isConnecting = true;
    });
    Timer timeoutTimer;
    try {
      timeoutTimer = Timer(const Duration(seconds: 10), () {
        if (_isConnecting) {
          //_showErrorDialog("Connection Timeout");
          setState(() {
            _isConnecting = false;
          });

          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pop(context);
          });
        }
      });
      await widget.selectedDevice.connect();
      widget.selectedDevice.state.listen((state) {
        if (state == BluetoothDeviceState.connected) {
          timeoutTimer.cancel();
          setState(() {
            _showTick = true;
          });
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pop(context);
          });
        }
      });
    } catch (e) {
      print(e);
      _showErrorDialog(e.toString());
    } finally {
      setState(() {
        _isConnecting = false;
      });
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isConnecting
            ? const CircularProgressIndicator()
            : _showTick
                ? const Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 100,
                  )
                : const Icon(
                    Icons.clear,
                    color: Colors.red,
                    size: 100,
                  ),
      ),
    );
  }
}
