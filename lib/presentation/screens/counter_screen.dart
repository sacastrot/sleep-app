import 'package:flutter/material.dart';

/// A StatefulWidget class representing a screen that displays sleep recommendations based on the current time.
class CounterScreen extends StatefulWidget {
  /// Constructor for the CounterScreen widget.
  const CounterScreen({super.key});

  /// Creates the State class for the CounterScreen widget.
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

/// The private State class for CounterScreen.
/// It holds the current time as a `DateTime` object (`_currentTime`).
/// Builds the UI for the screen using the `build` method.
class _CounterScreenState extends State<CounterScreen> {
  /// The current time as a `DateTime` object.
  DateTime _currentTime = DateTime.now();

  /// Builds the UI for the CounterScreen.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// The main content of the screen, centered on the screen.
      body: Center(
        child: Column(
          /// Aligns the widgets in the column vertically and horizontally.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// A row displaying an icon and text indicating it's time to sleep.
            const Row(
              /// Aligns the widgets in the row horizontally.
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// An icon representing sleep.
                Icon(Icons.nights_stay, size: 35),
                SizedBox(width: 10),

                /// Text indicating it's time to sleep.
                Text('Time to sleep',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w300,
                    )),
              ],
            ),
            const SizedBox(height: 10),

            /// A card containing information about sleep cycles and recommended wake-up times.
            SizedBox(
              width: 350,
              height: 520,
              child: Card(
                /// Adds elevation to the card for visual distinction.
                elevation: 5,

                /// Adds margin around the card.
                margin: const EdgeInsets.all(16),
                child: Padding(
                  /// Adds padding inside the card.
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    /// Allows the content to scroll if it exceeds the card's height.
                    child: Column(
                      /// Aligns the widgets in the column vertically and horizontally.
                      mainAxisAlignment: MainAxisAlignment.start,

                      /// Aligns the widgets in the column horizontally.
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// Text explaining the average time to fall asleep.
                        const Text(
                          'En promedio una persona tarda en dormir 14 minutos',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),

                        /// Text suggesting ideal wake-up times based on current time and sleep cycles (0 to 5).
                        const Text(
                            'Si va a la cama ahora, debería intentar despertar a las siguientes horas:',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16)),
                        const SizedBox(height: 30),

                        /// Displays recommended wake-up times for 0 to 5 sleep cycles.
                        for (int i = 0; i < 6; i++)
                          Container(
                            /// Adds margin below each container.
                            margin: const EdgeInsets.only(bottom: 7),

                            /// Adds padding around the container content.
                            padding: const EdgeInsets.only(
                              top: 0,
                              bottom: 7,
                              left: 10,
                              right: 10,
                            ),
                            width: 200,
                            child: Row(
                              /// Aligns the widgets in the row horizontally and distributes the space evenly.
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                /// Container displaying the sleep cycle number (e.g., 1, 2, 3).
                                Container(
                                  /// Adds margin to the right of the container.
                                  margin: const EdgeInsets.only(right: 10),

                                  /// Adds padding around the container content.
                                  padding: const EdgeInsets.only(
                                    left: 9,
                                    right: 9,
                                    top: 3,
                                    bottom: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    /// Sets a border around the container using the theme's primary color.
                                    border: Border.all(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),

                                    /// Creates a circular border for the container.
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Text(
                                    /// Displays the sleep cycle number (i + 1).
                                    '${i + 1}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ),

                                /// Text displaying the calculated wake-up time based on the current time and sleep cycles.
                                Text(
                                  _getSleepTime(_currentTime, i + 1),
                                  style: const TextStyle(fontSize: 18),
                                ),
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

/// Formats a `DateTime` object into a string representing the time in HH:MM format, adding leading zeros for single-digit hours and minutes.
String _formatTime(DateTime time) {
  /// Checks if both hour and minute are less than 10 and prepends a leading zero to each.
  if (time.minute < 10 && time.hour < 10) {
    return '0${time.hour}:0${time.minute}';
  } else if (time.hour < 10) {
    // Checks only for hour being less than 10
    return '0${time.hour}:${time.minute}';
  } else if (time.minute < 10) {
    // Checks only for minute being less than 10
    return '${time.hour}:0${time.minute}';
  } else {
    // If none of the above conditions are met, return the time without leading zeros.
    return '${time.hour}:${time.minute}';
  }
}

/// Calculates the recommended wake-up time based on the current time (`time`) and the number of sleep cycles (`cycles`).
String _getSleepTime(DateTime time, int cycles) {
  /// Adds 14 minutes to the current time to account for falling asleep.
  DateTime timeToSleep = time.add(const Duration(minutes: 14));

  /// Adds `cycles * 90 minutes` to account for the total sleep duration based on the number of cycles.
  timeToSleep = timeToSleep.add(Duration(minutes: cycles * 90));

  /// Formats the calculated wake-up time using the `_formatTime` function and returns it as a string.
  return _formatTime(timeToSleep);
}
