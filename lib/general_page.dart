import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:mywatchapp/test.dart';

class GeneralPage extends StatefulWidget {
  const GeneralPage({
    super.key,
  });

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  String name = "";
  bool _hasRunCommand = false;

  void runCommand() async {
    FlutterBlue flutterBlue = FlutterBlue.instance;
    List<BluetoothDevice> bondedDevices = await flutterBlue.connectedDevices;
    late BluetoothDevice hmSoftDevice;

    // Find device named "HMSoft"
    for (BluetoothDevice device in bondedDevices) {
      if (device.name == "HMSoft") {
        hmSoftDevice = device;
        break;
      }
    }

    List<BluetoothService> services = await hmSoftDevice.discoverServices();
    services.forEach((service) async {
      // do something with service
      if (service.uuid.toString() == "0000ffe0-0000-1000-8000-00805f9b34fb") {
        var characteristics = service.characteristics;
        for (BluetoothCharacteristic c in characteristics) {
          if (c.uuid.toString() == "0000ffe1-0000-1000-8000-00805f9b34fb") {
            c.write(utf8.encode('A'));
            List<int> value = await c.read();
            List<int> sentance = [];
            int test = 0;

            print(value);

            if (value.last != 92) {
              while (value.last != 92) {
                print("testoverall");

                test = test + 1;
                if (test == 15) {
                  test = 0;
                  return;
                }

                if (value.first == 47) {
                  sentance.addAll(value.sublist(1, value.length - 1));
                  c.write(utf8.encode('L'));
                  value = await c.read();
                  print("testonce");

                  continue;
                }

                if (value.last == 42) {
                  print(String.fromCharCodes(value));
                  sentance.addAll(value.sublist(0, value.length - 1));

                  c.write(utf8.encode('L'));
                  value = await c.read();
                  print("test");

                  test = test + 1;
                  if (test == 10) {
                    test = 0;
                    return;
                  }
                }
              }

              sentance.addAll(value.sublist(0, value.length - 1));
              print(sentance.length);
              changeName(String.fromCharCodes(sentance));
            } else if (value.last == 92) {
              sentance.addAll(value.sublist(1, value.length - 1));
              changeName(String.fromCharCodes(sentance));
            }
          }
          _hasRunCommand = true;
          return;
        }
      }
    });
  }

  @override
  void initState() {
    runCommand();
    super.initState();
  }

  void changeName(String newName) {
    setState(() {
      name = newName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (_hasRunCommand) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Text('GeneralPage'),
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
              padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(200, 34, 34, 34),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              testthis();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return Name(
                                      nameChange: changeName,
                                      name: name,
                                    );
                                  },
                                ),
                              );
                            },
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Name",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const Spacer(flex: 1),
                                  Text(
                                    name,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      ">",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              testthis();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const SoftwareUpdate(
                                        //test: widget.test,
                                        );
                                  },
                                ),
                              );
                            },
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Software Update",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    ">",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      testthis();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const WatchOrientation();
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(200, 34, 34, 34),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Watch Orientation",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    ">",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      testthis();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const ReturnToClock();
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(200, 34, 34, 34),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Return To Clock",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    ">",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class Name extends StatefulWidget {
  const Name({super.key, required this.nameChange, required this.name});
  final Function nameChange;
  final String name;
  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Name'),
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
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: TextField(
            onChanged: (String value) {
              widget.nameChange(value);
            },
            style: const TextStyle(color: Colors.white),
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 1,
                  color: Colors.white,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 1,
                  color: Colors.blue,
                ),
              ),
              counterStyle: const TextStyle(
                color: Colors.white,
              ),
              hintText: widget.name,
              hintStyle: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ));
  }
}

class SoftwareUpdate extends StatefulWidget {
  const SoftwareUpdate({
    super.key,
  });

  @override
  State<SoftwareUpdate> createState() => _SoftwareUpdateState();
}

class _SoftwareUpdateState extends State<SoftwareUpdate> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Software Update'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            testthis();
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }
}

class WatchOrientation extends StatefulWidget {
  const WatchOrientation({super.key});

  @override
  State<WatchOrientation> createState() => _WatchOrientationState();
}

class _WatchOrientationState extends State<WatchOrientation> {
  List<String> texts1 = [
    "Left Wrist",
    "Right Wrist",
  ];
  List<String> texts2 = [
    "Digital Crown on Left Side",
    "Digital Crown on Right Side",
  ];
  int _selectedIndex1 = 0;
  int _selectedIndex2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Watch Orientation'),
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
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Text(
                "WEAR WATCH ON",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                child: Wrap(
                  children: List.generate(
                      2,
                      (index) => InkWell(
                            onTap: () {
                              setState(() {
                                _selectedIndex1 = index;
                              });
                            },
                            child: Container(
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(200, 34, 34, 34),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          texts1[index],
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        const Spacer(flex: 1),
                                        _selectedIndex1 == index
                                            ? const Icon(Icons.check,
                                                color: Colors.orange)
                                            : const SizedBox(),
                                      ],
                                    )),
                              ),
                            ),
                          )),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                child: Wrap(
                  children: List.generate(
                      2,
                      (index) => InkWell(
                            onTap: () {
                              setState(() {
                                _selectedIndex2 = index;
                              });
                            },
                            child: Container(
                              height: 40,
                              decoration: const BoxDecoration(
                                // color: _selectedIndex2 == index
                                //     ? Colors.green
                                //     : Colors.blue,
                                color: Color.fromARGB(200, 34, 34, 34),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          texts2[index],
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        const Spacer(flex: 1),
                                        _selectedIndex2 == index
                                            ? const Icon(Icons.check,
                                                color: Colors.orange)
                                            : const SizedBox(),
                                      ],
                                    )),
                              ),
                            ),
                          )),
                ),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Text(
                "Specifying your wrist and Digital Crown preference helps the watch knows how to orient it when woken",
                style: TextStyle(
                  color: Colors.grey,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReturnToClock extends StatefulWidget {
  const ReturnToClock({super.key});

  @override
  State<ReturnToClock> createState() => _ReturnToClockState();
}

class _ReturnToClockState extends State<ReturnToClock> {
  List<String> texts = [
    "Always",
    "After 2 minutes",
    "After 1 hour",
    "After Crown Press",
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Return to Clock'),
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
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                child: Text(
                  "RETURN TO CLOCK",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  child: Wrap(
                    children: List.generate(
                        4,
                        (index) => InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = index;
                                });
                              },
                              child: Container(
                                height: 40,
                                decoration: const BoxDecoration(
                                  // color: _selectedIndex == index
                                  //     ? Colors.green
                                  //     : Colors.blue,
                                  color: Color.fromARGB(200, 34, 34, 34),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: <Widget>[
                                          Text(texts[index],
                                              style: const TextStyle(
                                                  color: Colors.white)),
                                          const Spacer(flex: 1),
                                          _selectedIndex == index
                                              ? const Icon(Icons.check,
                                                  color: Colors.orange)
                                              : const SizedBox(),
                                        ],
                                      )),
                                ),
                              ),
                            )),
                  ),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                child: Text(
                  "Watch will return to the Clock Face after a certain amount of time after the Digital Crown is pressed.",
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          )),
    );
  }
}
