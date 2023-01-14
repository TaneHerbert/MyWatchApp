import 'package:flutter/material.dart';

class SoundAndVolume extends StatefulWidget {
  const SoundAndVolume({super.key});

  @override
  State<SoundAndVolume> createState() => _SoundAndVolumeState();
}

class _SoundAndVolumeState extends State<SoundAndVolume> {
  double _currentSliderValue = 0.0;
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Sound and Volume'),
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
                "Volume",
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
                              Icons.volume_down,
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
                              Icons.volume_up,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Silent Mode",
                            style: TextStyle(color: Colors.white),
                          ),
                          Switch(
                            // This bool value toggles the switch.
                            value: light,
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
          ],
        ),
      ),
    );
  }
}
