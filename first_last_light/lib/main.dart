import 'package:flutter/material.dart';

void main() {
  runApp(const SunlightApp());
}

// Main app widget
class SunlightApp extends StatelessWidget {
  const SunlightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sunlight Card App',

      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.lightBlue),

      home: const HomePage(),
    );
  }
}

// I used StatefulWidget because city data changes after user searches.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// This class stores the changing data of the page.
class _HomePageState extends State<HomePage> {
  final TextEditingController cityController = TextEditingController();

  // Default city data shown when the app opens.
  String cityName = 'Kigali';
  String firstLight = '5:25 AM';
  String sunrise = '5:45 AM';
  String sunset = '6:08 PM';
  String lastLight = '6:28 PM';

  // Message to be displayed when the city is not found.
  String errorMessage = '';

  // This function runs when the user searches for a city.
  void searchCity() {
    String typedCity = cityController.text.trim().toLowerCase();

    setState(() {
      errorMessage = '';

      if (typedCity == 'kigali') {
        cityName = 'Kigali';
        firstLight = '5:25 AM';
        sunrise = '5:45 AM';
        sunset = '6:08 PM';
        lastLight = '6:28 PM';
      } else if (typedCity == 'nairobi') {
        cityName = 'Nairobi';
        firstLight = '5:40 AM';
        sunrise = '6:00 AM';
        sunset = '6:30 PM';
        lastLight = '6:50 PM';
      } else if (typedCity == 'london') {
        cityName = 'London';
        firstLight = '4:20 AM';
        sunrise = '4:43 AM';
        sunset = '9:20 PM';
        lastLight = '9:43 PM';
      } else if (typedCity == 'new york' || typedCity == 'nyc') {
        cityName = 'New York';
        firstLight = '5:05 AM';
        sunrise = '5:25 AM';
        sunset = '8:30 PM';
        lastLight = '8:50 PM';
      } else {
        errorMessage =
            'City not found. Try Kigali, Nairobi, London, or New York.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Light & Last Light'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,

        // Sky-like background using gradient colors.
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF4FC3F7), Color(0xFF81D4FA), Color(0xFFE1F5FE)],
          ),
        ),

        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              children: [
                const SizedBox(height: 20),

                const Icon(Icons.cloud, size: 80, color: Colors.white),

                const SizedBox(height: 20),

                const Text(
                  'Search a city to see sunlight times',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 10),

                const SizedBox(height: 25),

                // Search box.
                TextField(
                  controller: cityController,

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,

                    labelText: 'Search city',
                    hintText: 'Example: London',

                    prefixIcon: const Icon(Icons.location_city),

                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: searchCity,
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),

                  // Allows user to press Enter to search.
                  onSubmitted: (value) {
                    searchCity();
                  },
                ),

                const SizedBox(height: 12),

                // Error message appears only when city is not found.
                if (errorMessage.isNotEmpty)
                  Text(
                    errorMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                const SizedBox(height: 20),

                Card(
                  margin: const EdgeInsets.all(20),

                  elevation: 8,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(24),

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.wb_twilight,
                          size: 70,
                          color: Colors.deepOrange,
                        ),

                        const SizedBox(height: 10),

                        Text(
                          cityName,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5),

                        const Text(
                          'Today’s sunlight forecast',
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),

                        const SizedBox(height: 20),

                        SunlightRow(
                          title: 'First Light',
                          time: firstLight,
                          description: 'Sky starts becoming bright',
                          icon: Icons.light_mode,
                          iconColor: Colors.amber,
                        ),

                        SunlightRow(
                          title: 'Sunrise',
                          time: sunrise,
                          description: 'Sun appears above horizon',
                          icon: Icons.wb_sunny,
                          iconColor: Colors.orange,
                        ),

                        SunlightRow(
                          title: 'Sunset',
                          time: sunset,
                          description: 'Sun goes below horizon',
                          icon: Icons.wb_twilight,
                          iconColor: Colors.deepOrange,
                        ),

                        SunlightRow(
                          title: 'Last Light',
                          time: lastLight,
                          description: 'Sky becomes dark',
                          icon: Icons.nightlight_round,
                          iconColor: Colors.indigo,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// This widget helps us avoid repeating the same row design many times.
class SunlightRow extends StatelessWidget {
  final String title;
  final String time;
  final String description;
  final IconData icon;
  final Color iconColor;

  const SunlightRow({
    super.key,
    required this.title,
    required this.time,
    required this.description,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,

      leading: CircleAvatar(
        backgroundColor: iconColor.withOpacity(0.15),
        child: Icon(icon, color: iconColor),
      ),

      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),

      subtitle: Text(description),

      trailing: Text(time, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
