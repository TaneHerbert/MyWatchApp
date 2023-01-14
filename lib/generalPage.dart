import 'package:flutter/material.dart';

class GeneralPage extends StatefulWidget {
  const GeneralPage({super.key});

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  String name = "Tane";

  void changeName(String newName) {
    setState(() {
      name = newName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GeneralPage'),
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
        padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Name"),
                            const Spacer(flex: 1),
                            Text(name),
                            const Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(">"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const SoftwareUpdate();
                            },
                          ),
                        );
                      },
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Software Update"),
                            Text(">"),
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
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Watch Orientation"),
                            Text(">"),
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
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Return To Clock"),
                            Text(">"),
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
          title: const Text('Name'),
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
          padding: const EdgeInsets.all(10),
          child: TextField(
            onChanged: (String value) {
              widget.nameChange(value);
            },
            style: const TextStyle(color: Colors.white),
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 3,
                  color: Colors.white,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 3,
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
  const SoftwareUpdate({super.key});

  @override
  State<SoftwareUpdate> createState() => _SoftwareUpdateState();
}

class _SoftwareUpdateState extends State<SoftwareUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Software Update'),
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
        title: const Text('Watch Orientation'),
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
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: ClipRRect(
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
                                decoration: BoxDecoration(
                                  color: _selectedIndex1 == index
                                      ? Colors.green
                                      : Colors.blue,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: <Widget>[
                                          Text(texts1[index]),
                                          const Spacer(flex: 1),
                                          _selectedIndex1 == index
                                              ? const Icon(Icons.check,
                                                  color: Colors.white)
                                              : const SizedBox(),
                                        ],
                                      )),
                                ),
                              ),
                            )),
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: ClipRRect(
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
                                decoration: BoxDecoration(
                                  color: _selectedIndex2 == index
                                      ? Colors.green
                                      : Colors.blue,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: <Widget>[
                                          Text(texts2[index]),
                                          const Spacer(flex: 1),
                                          _selectedIndex2 == index
                                              ? const Icon(Icons.check,
                                                  color: Colors.white)
                                              : const SizedBox(),
                                        ],
                                      )),
                                ),
                              ),
                            )),
                  ),
                ),
              )),
        ],
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
        title: const Text('Watch Orientation'),
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
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: ClipRRect(
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
                            decoration: BoxDecoration(
                              color: _selectedIndex == index
                                  ? Colors.green
                                  : Colors.blue,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: <Widget>[
                                      Text(texts[index]),
                                      const Spacer(flex: 1),
                                      _selectedIndex == index
                                          ? const Icon(Icons.check,
                                              color: Colors.white)
                                          : const SizedBox(),
                                    ],
                                  )),
                            ),
                          ),
                        )),
              ),
            ),
          )),
    );
  }
}
