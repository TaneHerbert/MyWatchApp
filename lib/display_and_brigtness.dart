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
        padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              child: Text(
                "Brightness",
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
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Flexible(
                            flex: 1,
                            child: Icon(
                              Icons.cloud,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                          Flexible(
                            flex: 15,
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
                          const Flexible(
                            flex: 2,
                            child: Icon(
                              Icons.sunny,
                              size: 25,
                              color: Colors.white,
                            ),
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
                padding: const EdgeInsets.only(left: 20, right: 5),
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
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Text(
                "Your watch can always show the time. This will cause the battery to decrease very quick.",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 30),
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
                  padding: const EdgeInsets.only(left: 20, right: 20),
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
                              style: TextStyle(color: Colors.white),
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
    );
  }
}
