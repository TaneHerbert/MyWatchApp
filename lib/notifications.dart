import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Notifications'),
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
          children: [
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            FontAwesomeIcons.instagram,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Instagram",
                                style: TextStyle(color: Colors.white)),
                          ),
                          const Spacer(flex: 1),
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
                    SizedBox(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            FontAwesomeIcons.snapchat,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Snapchat",
                                style: TextStyle(color: Colors.white)),
                          ),
                          const Spacer(flex: 1),
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
                    SizedBox(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            FontAwesomeIcons.twitter,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Twitter",
                                style: TextStyle(color: Colors.white)),
                          ),
                          const Spacer(flex: 1),
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
                    SizedBox(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            FontAwesomeIcons.youtube,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Youtube",
                                style: TextStyle(color: Colors.white)),
                          ),
                          const Spacer(flex: 1),
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
                    SizedBox(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.mail,
                            size: 28,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Mail",
                                style: TextStyle(color: Colors.white)),
                          ),
                          const Spacer(flex: 1),
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
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: const [
                    SizedBox(
                      height: 50,
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Clear All",
                            style: TextStyle(color: Colors.white),
                          )),
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
