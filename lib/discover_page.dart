import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final Uri _url = Uri.parse('https://google.com');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Text(
              'Getting Started',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(200, 34, 34, 34),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.list_alt_outlined,
                      size: 100,
                      color: Colors.white,
                    )),
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: _launchUrl,
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Welcome to your New",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            "View online ↗",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Text(
              'Discover More Projects by Tane',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(200, 34, 34, 34),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.folder_shared_rounded,
                      size: 100,
                      color: Colors.white,
                    )),
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: _launchUrl,
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Welcome to your New",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            "View online ↗",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
