import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SetTime extends StatefulWidget {
  const SetTime({super.key});

  @override
  State<SetTime> createState() => _SetTimeState();
}

class _SetTimeState extends State<SetTime> {
  bool light = true;

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  TimeOfDay _selectedAlarmTime = const TimeOfDay(hour: 0, minute: 0);
  TimeOfDay _selectedAlarmTime2 = const TimeOfDay(hour: 0, minute: 0);
  TimeOfDay _selectedAlarmTime3 = const TimeOfDay(hour: 0, minute: 0);
  TimeOfDay _selectedAlarmTime4 = const TimeOfDay(hour: 0, minute: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Set Time & Alarms'),
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
                "Set Time",
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "24-Hour Time",
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
                          const Text(
                            "Set Automatically",
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
                    InkWell(
                      onTap: () async {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: _selectedTime,
                        );
                        if (time != null) {
                          setState(() {
                            _selectedTime = time;
                          });
                        }
                        final date = await showDatePicker(
                          context: context,
                          initialDate: _selectedDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (date != null) {
                          setState(() {
                            _selectedDate = date;
                          });
                        }
                      },
                      child: SizedBox(
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Spacer(flex: 2),
                              Text(
                                DateFormat("dd/MM/yyyy").format(_selectedDate),
                                style: const TextStyle(color: Colors.white),
                              ),
                              const Spacer(flex: 1),
                              Text(
                                _selectedTime.format(context),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              child: Text(
                "Set Alarms",
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
                padding: const EdgeInsets.only(left: 10, right: 5),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: _selectedAlarmTime,
                        );
                        if (time != null) {
                          setState(() {
                            _selectedAlarmTime = time;
                          });
                        }
                      },
                      child: SizedBox(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _selectedAlarmTime.format(context),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 50),
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
                    ),
                    InkWell(
                      onTap: () async {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: _selectedAlarmTime2,
                        );
                        if (time != null) {
                          setState(() {
                            _selectedAlarmTime2 = time;
                          });
                        }
                      },
                      child: SizedBox(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _selectedAlarmTime2.format(context),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 50),
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
                    ),
                    InkWell(
                      onTap: () async {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: _selectedAlarmTime3,
                        );
                        if (time != null) {
                          setState(() {
                            _selectedAlarmTime3 = time;
                          });
                        }
                      },
                      child: SizedBox(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _selectedAlarmTime3.format(context),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 50),
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
                    ),
                    InkWell(
                      onTap: () async {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: _selectedAlarmTime4,
                        );
                        if (time != null) {
                          setState(() {
                            _selectedAlarmTime4 = time;
                          });
                        }
                      },
                      child: SizedBox(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _selectedAlarmTime4.format(context),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 50),
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
