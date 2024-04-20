import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  DateTime _currentTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.nights_stay, size: 35),
                SizedBox(width: 10),
                Text('Time to sleep',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w300,
                    )),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 350,
              height: 520,
              child: Card(
                elevation: 5,
                margin: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'En promedio una persona tarda en dormir 14 minutos',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                            'Si va a la cama ahora, debería intentar despertar a las siguientes horas:',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16)),
                        const SizedBox(height: 30),
                        for (int i = 0; i < 6; i++)
                          Container(
                            margin: const EdgeInsets.only(bottom: 7),
                            padding: const EdgeInsets.only(
                                top: 0, bottom: 7, left: 10, right: 10),
                            width: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    padding: const EdgeInsets.only(
                                        left: 9, right: 9, top: 3, bottom: 3),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Text('${i + 1}',
                                        style: const TextStyle(fontSize: 14))),
                                Text(_getSleepTime(_currentTime, i + 1),
                                    style: const TextStyle(fontSize: 18)),
                              ],
                            ),
                          ),
                        const SizedBox(height: 30),
                        const Text('Cada ciclo de sueño dura 90 minutos',
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        enableFeedback: true,
        onPressed: () {
          setState(() {
            _currentTime = DateTime.now();
          });
        },
        child: const Icon(Icons.update_rounded),
      ),
    );
  }
}

String _formatTime(DateTime time) {
  if (time.minute < 10 && time.hour < 10) {
    return '0${time.hour}:0${time.minute}';
  }
  if (time.hour < 10) {
    return '0${time.hour}:${time.minute}';
  }
  if (time.minute < 10) {
    return '${time.hour}:0${time.minute}';
  }
  return '${time.hour}:${time.minute}';
}

String _getSleepTime(DateTime time, int cycles) {
  DateTime timeToSleep = time.add(const Duration(minutes: 14));
  timeToSleep = timeToSleep.add(Duration(minutes: cycles * 90));
  return _formatTime(timeToSleep);
}
