import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mywatchapp/test.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool instagram = true;
  bool snapchat = true;
  bool twitter = true;
  bool youtube = true;
  bool mail = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Notifications'),
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
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Text(
                "Notifications",
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
                            value: instagram,
                            activeColor: Colors.green,
                            onChanged: (bool value) {
                              // This is called when the user toggles the switch.
                              setState(() {
                                instagram = value;
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
                            value: snapchat,
                            activeColor: Colors.green,
                            onChanged: (bool value) {
                              // This is called when the user toggles the switch.
                              setState(() {
                                snapchat = value;
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
                            value: twitter,
                            activeColor: Colors.green,
                            onChanged: (bool value) {
                              // This is called when the user toggles the switch.
                              setState(() {
                                twitter = value;
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
                            value: youtube,
                            activeColor: Colors.green,
                            onChanged: (bool value) {
                              // This is called when the user toggles the switch.
                              setState(() {
                                youtube = value;
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
                            value: mail,
                            activeColor: Colors.green,
                            onChanged: (bool value) {
                              // This is called when the user toggles the switch.
                              setState(() {
                                mail = value;
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
                "Notifications appear when you'are wearing and not wearing your Watch. They won't appear on your watch when you're using your phone.",
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {},
              child: Container(
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
            ),
          ],
        ),
      ),
    );
  }
}
