import 'package:flutter/material.dart';

class DisplayAndBrightness extends StatefulWidget {
  const DisplayAndBrightness({super.key});

  @override
  State<DisplayAndBrightness> createState() => _DisplayAndBrightnessState();
}

class _DisplayAndBrightnessState extends State<DisplayAndBrightness> {
  double _currentSliderValue = 0.0;
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Display and Brightness'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Text(
                "BRIGHTNESS",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
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
                    SizedBox(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.cloud,
                            size: 25,
                            color: Colors.white,
                          ),
                          Flexible(
                            child: Slider(
                              value: _currentSliderValue,
                              max: 100,
                              divisions: 5,
                              label: _currentSliderValue.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _currentSliderValue = value;
                                });
                              },
                            ),
                          ),
                          const Icon(
                            Icons.sunny,
                            size: 25,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(200, 34, 34, 34),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Always On",
                              style: TextStyle(color: Colors.white)),
                          Switch(
                            // This bool value toggles the switch.
                            value: light,
                            inactiveThumbColor: Colors.grey,
                            inactiveTrackColor: Colors.grey,
                            activeColor: Colors.green,
                            onChanged: (bool value) {
                              // This is called when the user toggles the switch.
                              setState(() {
                                light = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Text(
                "Your watch can always show the time. This will cause the battery to decrease very quick.",
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const WakeDuration();
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
                  padding: const EdgeInsets.only(left: 20, right: 15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Wake Duraion",
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
  }
}

class WakeDuration extends StatefulWidget {
  const WakeDuration({super.key});

  @override
  State<WakeDuration> createState() => _WakeDurationState();
}

class _WakeDurationState extends State<WakeDuration> {
  List<String> texts1 = [
    "Wake for 15 Seconds",
    "Wake for 70 Seconds",
  ];

  int _selectedIndex1 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Wake Duration'),
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
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
                  "ON TAP",
                  style: TextStyle(color: Colors.grey),
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
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
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
              const Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                child: Text(
                  "Choose how long the Watch display stays on when you tap to wake it",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ));
  }
}
